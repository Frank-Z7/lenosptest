package com.len.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.len.entity.BlogArticle;
import com.len.model.Article;
import com.len.service.ArticleCategoryService;
import com.len.service.BlogArticleService;
import com.len.service.BlogCategoryService;
import com.len.util.IpUtil;
import com.len.util.LenResponse;
import com.len.util.ReType;

/**
 * 文章管理（后台）
 *
 * @author JamesZBL
 */

@CrossOrigin
@RestController
@RequestMapping("/blog")
public class ArticleController {

    @Autowired
    private BlogArticleService articleService;

    @GetMapping("/articleList")
    public String articleListPage() {
        return "articleList";
    }

    /**
     * 获取 文章列表
     *
     * @param code
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/article/list")
    public ReType getList(String code, Integer page, Integer limit) {
        limit = limit > 100 ? 100 : limit;
        Page<Object> startPage = PageHelper.startPage(page, limit);

        List<Article> articles;
        if (!StringUtils.isEmpty(code)) {
            articles = articleService.selectArticle(code);
        } else {
            articles = articleService.indexSelect();
        }

        return new ReType(startPage.getTotal(), startPage.getPageNum(), articles);
    }

    /**
     * 根据code获取文章内容
     *
     * @param code
     * @return
     */
    @GetMapping("/article/getDetail/{code}")
    public LenResponse detail(@PathVariable("code") String code, HttpServletRequest request) {
        String ip = IpUtil.getIp(request);
        return articleService.detail(code, ip);
    }

    /**
     * 根据标签code获取文章
     *
     * @param tagName
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/article/list/{tagName}")
    public ReType getArticleByTag(@PathVariable("tagName") String tagName, Integer page, Integer limit) {
        limit = limit > 100 ? 100 : limit;
        Page<Object> startPage = PageHelper.startPage(page, limit);

        List<Article> articles = articleService.selectArticleByTag(tagName);
        return new ReType(startPage.getTotal(), startPage.getPageNum(), articles);
    }

    @GetMapping("/article/list/order/read")
    public ReType getArticleByReadNumber() {
        QueryWrapper<BlogArticle> articleQueryWrapper = new QueryWrapper<>();
        articleQueryWrapper.orderByDesc("read_number");
        PageHelper.startPage(1, 5);
        List<BlogArticle> articles = articleService.list(articleQueryWrapper);
        articles.forEach(s -> {
            s.setContent(null);
            String title = s.getTitle();
            if (title.length() > 25) {
                title = title.substring(0, 25) + "...";
                s.setTitle(title);
            }
        });
        ReType reType = new ReType();
        reType.setData(articles);
        return reType;
    }
}
