<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>echarts demo1</title>
<%@ include file="/WEB-INF/views/commons/head.jsp"%>
<!-- 引入 ECharts 文件 -->
<script src="${ctx}/echarts/echarts.min.js"></script>


</head>
<body>
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
	<div class="container">
	    <div id="main" style="width: 600px;height:400px;float:left;"></div>
	    <div id="mainPai" style="width: 600px;height:400px;float:left;"></div>
	    <div id="dataChart" style="width: 600px;height:400px;float:left;"></div>
	    <div id="dataZoomChart" style="width: 600px;height:400px;float:left;"></div>
	    <div id="visualMapChart" style="width: 600px;height:400px;float:left;"></div>
	</div>    
    
    <script type="text/javascript">
    
    
    	var firstnames ={'name1':'10','name2':'40','name3':'50'};
    	firstnames = $.map(firstnames,function(item,index){
    		return {item};
    	});
    	console.debug(firstnames);
    
    
	     /****************  第一幅图  ******************/
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: 'ECharts 示例'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        
        
        /****************  第二幅图  *******************/
        // 基于准备好的dom，初始化echarts实例
        var myPaiChart = echarts.init(document.getElementById('mainPai'));

        /*
        *	背景色是全局的，所以直接在 option 下设置 backgroundColor
        *	文本的样式可以设置全局的 textStyle。也可以每个系列分别设置，每个系列的文本设置在 label.normal.textStyle。
        */
        myPaiChart.setOption({
       	    backgroundColor: 'lightyellow',
	       	 label: {
	       	    normal: {
	       	        textStyle: {
	       	            color: 'rgba(0,0,0, 0.3)'
	       	        }
	       	    }
	       	}
        	,
        	series : [
        	          {
        	              name: '访问来源',
        	              type: 'pie',
        	              radius: '55%',
        	              roseType: 'angle',
        	              data:[
        	                  {value:500, name:'搜索引擎',itemStyle: {
        	                      normal: {
        	                          color: 'lightgreen'
        	                      }
        	                  }},
        	                  {value:250, name:'直接访问',itemStyle: {
        	                      normal: {
        	                          color: 'orange'
        	                      }
        	                  }},
        	                  {value:300, name:'邮件营销',itemStyle: {
        	                      normal: {
        	                          color: 'lightpink'
        	                      }
        	                  }},
        	                  {value:500, name:'联盟广告',itemStyle: {
        	                      normal: {
        	                          color: 'lightblue'
        	                      }
        	                  }},
        	                  {value:235, name:'视频广告',}
        	              ]
        	          }
        	      ]
        });
        
        /****************  第三幅图  ******************/
        var dataChart = echarts.init(document.getElementById('dataChart'));
        /****************  第五幅图  ******************/
        var visualMapChart = echarts.init(document.getElementById('visualMapChart'));
        
       	dataChart.setOption({
       		   title: {
                   text: '年龄展示'
               },
               tooltip: {},
               legend: {
               	data:['年龄']
               },
               xAxis: {
                   data: []
               },
               yAxis: {},
               series: [{
                   name: '年龄',
                   type: 'bar',
                   data: []
               }]
           });
        
       	dataChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
       	
       	visualMapChart.setOption({
     	   		title : {
			        text: '高亮饼图',
			        x: 'center'
			    },
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: []
			    },
			    series : [
			        {
			            name: '访问来源',
			            type: 'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
// 			                {value:335, name:'直接访问'},
// 			                {value:310, name:'邮件营销'},
// 			                {value:234, name:'联盟广告'},
// 			                {value:135, name:'视频广告'},
// 			                {value:1548, name:'搜索引擎'}
			            ],
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
        });
        
        var names=[];    //名称数组（实际用来盛放X轴坐标值）
        var ages=[];    //年龄数组（实际用来盛放Y坐标值）
        
        
        $.ajax({
            type : "post",
            async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url : _ctx + '/user/listAll.do',    //请求发送到TestServlet处
            data : {},
            dataType : "json",        //返回数据形式为json
            success : function(result) {
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                if (result) {
                       for(var i=0;i<result.length;i++){       
                          names.push(result[i].name);    //挨个取出姓名并填入类别数组
                        }
                       for(var i=0;i<result.length;i++){       
                    	   ages.push(result[i].age);    //挨个取出年龄并填入销量数组
                         }
                       dataChart.hideLoading();    //隐藏加载动画
                       dataChart.setOption({        //加载数据图表
                           xAxis: {
                               data: names
                           },
                           series: [{
                               // 根据名字对应到相应的系列
                               name: '年龄',
                               data: ages
                           }]
                       });
                       
                       visualMapChart.setOption({
              			    legend: {
              			        data: names
              			    },
              			    series : [
              			        {
              			            name: '年龄',
              			            type: 'pie',
              			            radius : '55%',
              			            center: ['50%', '60%'],
              			            data:[
              			                {value:335, name:'直接访问'},
              			                {value:310, name:'邮件营销'},
              			                {value:234, name:'联盟广告'},
              			                {value:135, name:'视频广告'},
              			                {value:1548, name:'搜索引擎'}
              			            ],
              			            itemStyle: {
              			                emphasis: {
              			                    shadowBlur: 10,
              			                    shadowOffsetX: 0,
              			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
              			                }
              			            }
              			        }
              			    ]
                       });
                       
                       //****第五幅图****

               			var currentIndex = -1;

               			var timeTicket = setInterval(function () {
               			    var dataLen = option.series[0].data.length;
               			    // 取消之前高亮的图形
               			    visualMapChart.dispatchAction({
               			        type: 'downplay',
               			        seriesIndex: 0,
               			        dataIndex: currentIndex
               			    });
               			    currentIndex = (currentIndex + 1) % dataLen;
               			    // 高亮当前图形
               			    visualMapChart.dispatchAction({
               			        type: 'highlight',
               			        seriesIndex: 0,
               			        dataIndex: currentIndex
               			    });
               			    // 显示 tooltip
               			    visualMapChart.dispatchAction({
               			        type: 'showTip',
               			        seriesIndex: 0,
               			        dataIndex: currentIndex
               			    });
               			}, 1000);
               
                }
           },
            error : function(errorMsg) {
                //请求失败时执行该函数
            alert("图表请求数据失败!");
            dataChart.hideLoading();
            }
       })
       
       /****************  第四幅图  ******************/
       var dataZoomChart = echarts.init(document.getElementById('dataZoomChart'));
        
        var option4 = {
        		xAxis: {
        	        type: 'value'
        	    },
        	    yAxis: {
        	        type: 'value'
        	    },
        	    dataZoom: [
        	        {   // 这个dataZoom组件，默认控制x轴。
        	            type: 'slider', // 这个 dataZoom 组件是 slider 型 dataZoom 组件
        	            start: 10,      // 左边在 10% 的位置。
        	            end: 60         // 右边在 60% 的位置。
        	        }
        	    ],
        	    series: [
        	        {
        	            type: 'scatter', // 这是个『散点图』
        	            itemStyle: {
        	                normal: {
        	                    opacity: 0.8
        	                }
        	            },
        	            symbolSize: function (val) {
        	                return val[2] * 40;
        	            },
        	            data: [["14.616","7.241","0.896"],["3.958","5.701","0.955"],["2.768","8.971","0.669"],["9.051","9.710","0.171"],["14.046","4.182","0.536"],["12.295","1.429","0.962"],["4.417","8.167","0.113"],["0.492","4.771","0.785"],["7.632","2.605","0.645"],["14.242","5.042","0.368"]]
        	        }
        	    ]
        	}
        
        dataZoomChart.setOption(option4);
        
        
        /****************  第五幅图  ******************/
        
        
        
        
        
        
        
        
        
    </script>
    
    
</body>
</html>