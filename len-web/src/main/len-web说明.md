
# len-webĿ¼�ṹ
1. Ŀ¼�ṹ

 ```
   ����src
   ��  ����main
   ��      ����java
   ��      ��  ����com
   ��      ��  ��  ����len
   ��      ��  ��      ��  LenApplication.java   ������
   ��      ��  ��      ��
   ��      ��  ��      ����config
   ��      ��  ��              BeanFactoryImpl.java   ��������
   ��      ��  ��              BeanName.java
   ��      ��  ��              DruidConfig.java       ����Դ
   ��      ��  ��              FreeMarkerConfig.java  freemarker����������������
   ��      ��  ��              FreemarkerShiroConfig.java
   ��      ��  ��              LenFilter.java
   ��      ��  ��              LogConfig.java
   ��      ��  ��              MyBatisPlusConfig.java
   ��      ��  ��              MyModularRealmAuthenticator.java
   ��      ��  ��              PageHelperConfig.java
   ��      ��  ��              ShiroConfig.java
   ��      ��  ��              ShiroSessionManager.java
   ��      ��  ��              SocketConfig.java
   ��      ��  ��              SwaggerConfig.java
   ��      ��  ��              TransactionalConfig.java
   ��      ��  ��              WebMvcConfig.java
   ��      ��  ��              ZBeanFactory.java
   ��      ��  ��
   ��      ��  ����test     ���԰����Զ���
   ��      ��
   ��      ����resources
   ��          ��
   ��          ����auto-config
   ��          ��      mybatis-config.xml
   ��          ��
   ��          ����ehcache
   ��                  ehcache.xml
   ��
 ```

## �Ż�sql
1. ִ��PMD������

2. ##### ʹ��expl ain�鿴�Լ���д��Sqlִ�������

3. ##### д��Sql����������������ƥ��ԭ��ʹ��������

4. ##### ��ѯSQL������Ҫʹ��select *�����Ǿ����ֶ�

5. ##### where��ʹ��Ĭ��ֵ����null

6. ##### ���Ⱦ�������ģ����ѯ���������ʹ�ã�������ȫģ����ѯ��ҲӦ����������ģ����ѯ�� ��`like ����%��`���ǻ�ʹ�������ģ�

7. ##### ������where�Ӿ���ʹ��!=��<>������

   ʹ��`!=`��`<>`�ܿ��ܻ�������ʧЧ

   Ӧ����������`where`�Ӿ���ʹ��`!=`��`<>`���������������潫����ʹ������������ȫ��ɨ��

8. ##### ������where�Ӿ���ʹ�� or ����������    ʹ��union all  ����

   ```
   SELECT?*?FROM?a WHERE?id=1?UNION?ALL SELECT?*?FROM? a  WHERE?salary=5000 
   ```

   ԭ��

   - ʹ��`or`���ܻ�ʹ����ʧЧ���Ӷ�ȫ��ɨ�裻

   - ����`or`û��������`salary`�������������������`id`�������������ߵ�`salary`��ѯ����ʱ��������ȫ��ɨ�裻

     ##### 