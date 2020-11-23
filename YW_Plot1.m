% function [outputArg1,outputArg2] = YW_Plot1(XXX,YYY,legend_name,title_name,x_label,y_label,flag...
%     ,XXX2,YYY2,legend_name_two,~,y_label2 )
function [outputArg1] = YW_Plot1(general,data,another_axis)
%% YW_Plot1 此处显示有关此函数的摘要
%   此处显示详细说明
%  版本一
outputArg1 = 'Done';
% outputArg2 = inputArg2;
% 如果只需要一根线，变量只需要到flag前就行
% 如果flag=1，用原来的轴画第二根线
% 如果flag=2，新建一根y轴
% general 共用的信息（元胞），设置如下
%{ 0
general = {'figure name', 'your figure name';
    'title name','your title';
    'x_label','your x label';
    'y_label','your y label';
    };
%}
% date 以第一条y轴作图的数据，设置如下
%{0
x1 = 0:0.01:5;y1=cos(x1);
x2=1:0.2:6;y2=sin(x2);
x3=1:0.05:4;y3=x3;
data = {'x', 'y','lengend','color','LineStyle';
    x1,y1,'datavhg1','b','-';
    x2,y2,'shu2',[0.5,0.5,0],'-.';
    x3,y3,'lbukl','r',':';
    };
%}
% another_axis 以第二条y轴作图的数据，设置如下
%{0
x1 = 0:0.01:5;y1=1+cos(x1);
x2=1:0.2:6;y2=2*sin(x2);
x3=1:0.05:4;y3=2*x3;
another_axis = {'x', 'y','lengend','color','LineStyle';
    x1,y1,'datavhg1','k','-';
    x2,y2,'shu2',[0.5,0.1,0.2],'-.';
    x3,y3,'lbukl','p',':';
    };
%}
%% 此处定义一些默认的值
MarkerSize = 6;
Interpreter = 'latex';
FontSize = 14;
nargin

%% 适用于单个y轴的情况
%     clear all;close all;
%     XXX=0:0.01:100;
%     YYY=cos(XXX);
%% 设置图形窗口，用了第二种方法，方便单独注释
%{
    Hf_this = figure(...
        'Name','your figure window name here',... % 窗口名字
        'NumberTitle','off',...	% 是否显示名字前面的Figure 1
        'Color','white',... % 背景颜色none,'red','green','blue','cyan','magenta','yellow','black',也可用RGB,如[110]
        'Renderer', 'painters',...	% 渲染器
        'Position', [1041 304 560 420],... % 含义分别为左和下边缘到窗口，宽度，高度，比例最好为4:3,...
        'Units','pixels'... % 单位，默认是pixels,归一化为'normalized',
        );
%}
Hf_this = figure;
set(Hf_this,'Name',general{1,2}); % 窗口名字
Hf_this.NumberTitle='off'; % 是否显示名字前面的Figure 1 %同时可以看出操作句柄的两种形式
title(general{2,2}); %标题名字
set(Hf_this,'Color','white')% 背景颜色none,'red','green','blue','cyan','magenta','yellow','black',也可用RGB,如[110]
set(Hf_this,'Renderer', 'painters')% 渲染器
set(Hf_this,'Position', [1041 304 560 420])% 含义分别为左和下边缘到窗口，宽度，高度，比例最好为4:3
set(Hf_this,'Units', 'pixels')% 单位，默认是pixels,归一化为'normalized'

%% 绘图区
[rows,cols] = size(data); % 获取数据的行列，注意第一行是标题，应该除开
for order = 2:rows
    x = data{order,1};
    y = data{order,2};
    legend_name = data{order,3};
    color = data{order,4};
    LineStyle = data{order,5};
    plot(x,y,'color',color,'LineStyle',LineStyle,'LineWidth',2,'MarkerSize',MarkerSize,'MarkerEdgeColor',color,...
        'MarkerFaceColor',[.49 1 .63])
    legend_str{order-1} = [legend_name];
    hold on;
    
    
end
%% 标签，图注，坐标轴更改
Hlgd=legend;
%     set(Hlgd,'String','legend $\alpha$ $\beta$') % 标签名词
%     set(Hlgd,'String',legend_name) % 标签名词
legend(legend_str) % 标签名词
%     set(Hlgd, 'FontSize',FontSize-2)
%     set(Hlgd, 'TextColor',color )
set(Hlgd, 'Location','northwest')% best,详细阅读手册
set(Hlgd, 'Interpreter',Interpreter)
set(Hlgd, 'Box','on') %是否 删除图例轮廓

Ha_this = gca; % get the axes object
set(Ha_this,'lineWidth',1.5,'FontSize', FontSize,'FontWeight','bold');
set(Ha_this,'XMinorTick','on'); %打开小刻度
x_label = general{3,2};
y_label = general{4,2};
xlabel(x_label,'FontSize', FontSize,'FontWeight','bold');
ylabel(y_label,'FontSize', FontSize,'FontWeight','bold');
Ha_this.TickDir = 'out'; % 刻度方向 out in both
% xticks('auto'); %或者用一个向量
% xticklabels([2 3 4]); % 要显示那些数字的标签


% %% 设置第二个y轴
% %------------------------------------------------------
if true
    yyaxis right;
    %         y = 100*sin(XXX);
    [rows,cols] = size(another_axis); % 获取数据的行列，注意第一行是标题，应该除开
    for order = 2:rows
        x = another_axis{order,1};
        y = another_axis{order,2};
        legend_name = another_axis{order,3};
        color = another_axis{order,4};
        LineStyle = another_axis{order,5};
        plot(x,y,'color',color,'LineStyle',LineStyle,'LineWidth',2,'MarkerSize',MarkerSize,'MarkerEdgeColor',color,...
            'MarkerFaceColor',[.49 1 .63],'DisplayName',legend_name)
%         legend_str{order-1} = [legend_name];
        hold on;
        
        
    end
    second_axis = gca;
    ylabel(second_axis,y_label2,'FontSize', 14,'FontWeight','bold');
    set(second_axis,'ycolor','r') % 设置标签颜色
    
    %------------------------------------------------------
end

%% 其它设置
% box on; %是否显示边框
box off
% grid on;
% grid minor;
% saveas(Hf_this, 'WithMargins.eps','psc2')
%%
% 所有matlab的图，一律复制为矢量图，另外保存好原fig文件。
% 图采用4:3长宽比例（eg. 560比420）；图中曲线颜色为蓝色，
% 线宽为2号加粗；数据拟合曲线采用不连续红色线加粗；数据
% 点用圆圈marker表示；横纵坐标和横纵坐标轴为14号Helvetica
% 字体加粗，tick可以自己定义。

end