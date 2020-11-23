% function [outputArg1,outputArg2] = YW_Plot1(XXX,YYY,legend_name,title_name,x_label,y_label,flag...
%     ,XXX2,YYY2,legend_name_two,~,y_label2 )
function [outputArg1] = YW_Plot1(general,data,another_axis)
%% YW_Plot1 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%  �汾һ
outputArg1 = 'Done';
% outputArg2 = inputArg2;
% ���ֻ��Ҫһ���ߣ�����ֻ��Ҫ��flagǰ����
% ���flag=1����ԭ�����ử�ڶ�����
% ���flag=2���½�һ��y��
% general ���õ���Ϣ��Ԫ��������������
%{ 0
general = {'figure name', 'your figure name';
    'title name','your title';
    'x_label','your x label';
    'y_label','your y label';
    };
%}
% date �Ե�һ��y����ͼ�����ݣ���������
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
% another_axis �Եڶ���y����ͼ�����ݣ���������
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
%% �˴�����һЩĬ�ϵ�ֵ
MarkerSize = 6;
Interpreter = 'latex';
FontSize = 14;
nargin

%% �����ڵ���y������
%     clear all;close all;
%     XXX=0:0.01:100;
%     YYY=cos(XXX);
%% ����ͼ�δ��ڣ����˵ڶ��ַ��������㵥��ע��
%{
    Hf_this = figure(...
        'Name','your figure window name here',... % ��������
        'NumberTitle','off',...	% �Ƿ���ʾ����ǰ���Figure 1
        'Color','white',... % ������ɫnone,'red','green','blue','cyan','magenta','yellow','black',Ҳ����RGB,��[110]
        'Renderer', 'painters',...	% ��Ⱦ��
        'Position', [1041 304 560 420],... % ����ֱ�Ϊ����±�Ե�����ڣ���ȣ��߶ȣ��������Ϊ4:3,...
        'Units','pixels'... % ��λ��Ĭ����pixels,��һ��Ϊ'normalized',
        );
%}
Hf_this = figure;
set(Hf_this,'Name',general{1,2}); % ��������
Hf_this.NumberTitle='off'; % �Ƿ���ʾ����ǰ���Figure 1 %ͬʱ���Կ������������������ʽ
title(general{2,2}); %��������
set(Hf_this,'Color','white')% ������ɫnone,'red','green','blue','cyan','magenta','yellow','black',Ҳ����RGB,��[110]
set(Hf_this,'Renderer', 'painters')% ��Ⱦ��
set(Hf_this,'Position', [1041 304 560 420])% ����ֱ�Ϊ����±�Ե�����ڣ���ȣ��߶ȣ��������Ϊ4:3
set(Hf_this,'Units', 'pixels')% ��λ��Ĭ����pixels,��һ��Ϊ'normalized'

%% ��ͼ��
[rows,cols] = size(data); % ��ȡ���ݵ����У�ע���һ���Ǳ��⣬Ӧ�ó���
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
%% ��ǩ��ͼע�����������
Hlgd=legend;
%     set(Hlgd,'String','legend $\alpha$ $\beta$') % ��ǩ����
%     set(Hlgd,'String',legend_name) % ��ǩ����
legend(legend_str) % ��ǩ����
%     set(Hlgd, 'FontSize',FontSize-2)
%     set(Hlgd, 'TextColor',color )
set(Hlgd, 'Location','northwest')% best,��ϸ�Ķ��ֲ�
set(Hlgd, 'Interpreter',Interpreter)
set(Hlgd, 'Box','on') %�Ƿ� ɾ��ͼ������

Ha_this = gca; % get the axes object
set(Ha_this,'lineWidth',1.5,'FontSize', FontSize,'FontWeight','bold');
set(Ha_this,'XMinorTick','on'); %��С�̶�
x_label = general{3,2};
y_label = general{4,2};
xlabel(x_label,'FontSize', FontSize,'FontWeight','bold');
ylabel(y_label,'FontSize', FontSize,'FontWeight','bold');
Ha_this.TickDir = 'out'; % �̶ȷ��� out in both
% xticks('auto'); %������һ������
% xticklabels([2 3 4]); % Ҫ��ʾ��Щ���ֵı�ǩ


% %% ���õڶ���y��
% %------------------------------------------------------
if true
    yyaxis right;
    %         y = 100*sin(XXX);
    [rows,cols] = size(another_axis); % ��ȡ���ݵ����У�ע���һ���Ǳ��⣬Ӧ�ó���
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
    set(second_axis,'ycolor','r') % ���ñ�ǩ��ɫ
    
    %------------------------------------------------------
end

%% ��������
% box on; %�Ƿ���ʾ�߿�
box off
% grid on;
% grid minor;
% saveas(Hf_this, 'WithMargins.eps','psc2')
%%
% ����matlab��ͼ��һ�ɸ���Ϊʸ��ͼ�����Ᵽ���ԭfig�ļ���
% ͼ����4:3���������eg. 560��420����ͼ��������ɫΪ��ɫ��
% �߿�Ϊ2�żӴ֣�����������߲��ò�������ɫ�߼Ӵ֣�����
% ����ԲȦmarker��ʾ����������ͺ���������Ϊ14��Helvetica
% ����Ӵ֣�tick�����Լ����塣

end