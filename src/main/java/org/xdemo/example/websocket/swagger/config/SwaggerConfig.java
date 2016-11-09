package org.xdemo.example.websocket.swagger.config;
import org.springframework.context.annotation.Bean;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
public class SwaggerConfig {

    /**
     * 
     *  <p>Author:yjh;</p>
     *  <p>Date:2016年11月9日上午11:20:12;</p>
     *	<p>Description: 
     *   Docket的select()方法会提供给swagger-springmvc framework的一个默认构造器（ApiSelectorBuilder），这个构造器为配置swagger提供了一系列的默认属性和便利方法。
     *  </p>
     *
     *  @return
     */
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("org.xdemo.example.websocket.app.controller"))    // 对指定包下的api进行监控
                .paths(PathSelectors.any()) // 对所有路径进行监控    
                .build();   
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("示例app接口文档(所有编码为utf8)")
                .version("1.0")
                .description("这里是文档描述。。。</br>xxxxxxxxxxx")
                .build();
    }
}