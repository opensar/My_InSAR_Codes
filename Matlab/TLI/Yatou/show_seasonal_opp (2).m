% 2003�꣬�����ﶬ�ļ�OPP�ֲ���
clear;
clc;
file_path= 'D:\myfiles\Yatou_paper\result\data';
result_path= 'D:\myfiles\Yatou_paper\result';
opp_2002= dir(strcat(file_path, '\S2004*'));
opp_2003= dir(strcat(file_path, '\S2003*'));
% load(result_file, 'opp_vgpm','sst','chl','Zeu');
sz= size(load((strcat(file_path, '\',opp_2003(1).name)), 'opp_vgpm'));
opp_spring= zeros(sz);
opp_summer= zeros(sz);
opp_autumn= zeros(sz);
opp_winter= zeros(sz);

for i=0:11
    if i>0
        file_name= strcat(file_path, '\', opp_2003(i).name);
    end
    if i<=2 %��
        if i==0
            file_name_2002_end= strcat(file_path, '\', opp_2002(end).name);
            load(file_name_2002_end, 'opp_vgpm');
        else
            opp_spring= opp_spring+opp_vgpm/3;
            load(file_name, 'opp_vgpm');
            opp_spring= opp_spring+opp_vgpm/3;
        end
    else if i<=5 %��
            load(file_name, 'opp_vgpm');
            opp_summer= opp_summer+opp_vgpm/3;            
        else if i<=8 % ��
                load(file_name, 'opp_vgpm');
                opp_autumn= opp_autumn+opp_vgpm/3;
            else %��
                load(file_name, 'opp_vgpm','chl');
                opp_winter= opp_winter+opp_vgpm/3;
            end
        end
    end
end
opp_spring(chl==-32767)=nan;
opp_summer(chl==-32767)=nan;
opp_autumn(chl==-32767)=nan;
opp_winter(chl==-32767)=nan;

%������ͼ��Ϣ
range=[598,812,3566,3696];
X=[-180:0.0833333:180];
Y=fliplr([-90:0.0833333:90]);
lats_range= Y(range(1):range(2));%γ�ȵ��ܷ�Χ
lons_range= X(range(3):range(4));%���ȵ��ܷ�Χ

%--------------------------------��ͼ-----------------------
scale=600/max(max(size(chl)));%�������
% ��
figure( 'Position',[50,50,scale*size(opp_autumn,2),scale*size(opp_autumn,1)]);
    h=imagesc(opp_autumn);
    set(h, 'alphadata', ~isnan(opp_autumn));
%     caxis(data_range);
    data_range= caxis;
    data_range(2)=3500;
    caxis(data_range);
    % set(gcf, 'Color', [1,1,1])
    name= strcat('Opp of 2003 Spring(Jun.-Aug.).  ', '(mg��C��m^-^2��day^-^1)');
    title(name,'fontsize',8);
    
    y_ticks_colorbar= [int16(data_range(1)/100)*100:100:int16(data_range(2))];
    colorbar( 'YTick', y_ticks_colorbar, 'YTicklabel',y_ticks_colorbar);
    
    x_ticks=5;
    y_ticks=5;
    x_step=size(opp_spring,2)/x_ticks;  %����x�����������������ʾһ���̶ȡ�
    y_step=size(opp_spring,1)/y_ticks;  %����y�����������������ʾһ���̶ȡ�
    xtick_loc= round(1:x_step:size(opp_spring,2));%����x��������ʾ�̶ȵ�λ�á�
    ytick_loc= round(1:y_step:size(opp_spring,1));%����y��������ʾ�̶ȵ�λ�á�
    set(gca, 'XTick', xtick_loc);% ����x������Ҫ��ʾ�Ŀ̶�ֵ��
    set(gca, 'YTick', ytick_loc);% ����y������Ҫ��ʾ�Ŀ̶�ֵ��
    set(gca, 'XTickLabel', {round(lons_range(xtick_loc))});
    set(gca, 'YTickLabel', {round(lats_range(ytick_loc))})
    set(gca, 'Color', 'white');
%     set(hc, 'YTick', [400,500,600,700], 'YTicklabel',[400,500,600,700]);
    xlabel ('Longitude(E)','fontsize',10);
    ylabel ('Latitude(N)','fontsize',10);
    outname= strcat(result_path,'\2003���ļ�opp-����ɫ����.bmp');
    saveas(gcf, outname);
% ��
figure( 'Position',[50,50,scale*size(opp_spring,2),scale*size(opp_spring,1)]);
    h=imagesc(opp_spring);
    set(h, 'alphadata', ~isnan(opp_spring));
    caxis(data_range);
%     data_range= caxis;
    % set(gcf, 'Color', [1,1,1])
    name= strcat('Opp of 2002 Winter(Dec.2002- Feb.2003).  ', '(mg��C��m^-^2��day^-^1)');
    title(name,'fontsize',8);
    colorbar( 'YTick', y_ticks_colorbar, 'YTicklabel',y_ticks_colorbar);
    x_ticks=5;
    y_ticks=5;
    x_step=size(opp_spring,2)/x_ticks;  %����x�����������������ʾһ���̶ȡ�
    y_step=size(opp_spring,1)/y_ticks;  %����y�����������������ʾһ���̶ȡ�
    xtick_loc= round(1:x_step:size(opp_spring,2));%����x��������ʾ�̶ȵ�λ�á�
    ytick_loc= round(1:y_step:size(opp_spring,1));%����y��������ʾ�̶ȵ�λ�á�
    set(gca, 'XTick', xtick_loc);% ����x������Ҫ��ʾ�Ŀ̶�ֵ��
    set(gca, 'YTick', ytick_loc);% ����y������Ҫ��ʾ�Ŀ̶�ֵ��
    set(gca, 'XTickLabel', {round(lons_range(xtick_loc))});
    set(gca, 'YTickLabel', {round(lats_range(ytick_loc))})
    set(gca, 'Color', 'white');
    xlabel ('Longitude(E)','fontsize',10);
    ylabel ('Latitude(N)','fontsize',10);
    outname= strcat(result_path,'\2002�궬��opp-����ɫ����.bmp');
    saveas(gcf, outname);
% ��
figure( 'Position',[50,50,scale*size(opp_summer,2),scale*size(opp_summer,1)]);
    h=imagesc(opp_summer);
    set(h, 'alphadata', ~isnan(opp_summer));
    caxis(data_range);
%     data_range= caxis;
    % set(gcf, 'Color', [1,1,1])
    name= strcat('Opp of 2003 Spring(Mar.-May).  ', '(mg��C��m^-^2��day^-^1)');
    title(name,'fontsize',8);
    colorbar( 'YTick', y_ticks_colorbar, 'YTicklabel',y_ticks_colorbar);
    x_ticks=5;
    y_ticks=5;
    x_step=size(opp_spring,2)/x_ticks;  %����x�����������������ʾһ���̶ȡ�
    y_step=size(opp_spring,1)/y_ticks;  %����y�����������������ʾһ���̶ȡ�
    xtick_loc= round(1:x_step:size(opp_spring,2));%����x��������ʾ�̶ȵ�λ�á�
    ytick_loc= round(1:y_step:size(opp_spring,1));%����y��������ʾ�̶ȵ�λ�á�
    set(gca, 'XTick', xtick_loc);% ����x������Ҫ��ʾ�Ŀ̶�ֵ��
    set(gca, 'YTick', ytick_loc);% ����y������Ҫ��ʾ�Ŀ̶�ֵ��
    set(gca, 'XTickLabel', {round(lons_range(xtick_loc))});
    set(gca, 'YTickLabel', {round(lats_range(ytick_loc))})
    set(gca, 'Color', 'white');
    xlabel ('Longitude(E)','fontsize',10);
    ylabel ('Latitude(N)','fontsize',10);
    outname= strcat(result_path,'\2003�괺��opp-����ɫ����.bmp');
    saveas(gcf, outname);

% ��
figure( 'Position',[50,50,scale*size(opp_winter,2),scale*size(opp_winter,1)]);
    h=imagesc(opp_winter);
    set(h, 'alphadata', ~isnan(opp_winter));
    caxis(data_range);
%     data_range= caxis;
    % set(gcf, 'Color', [1,1,1])
    name= strcat('Opp of 2003 Autumn(Sep.-Nov.).  ', '(mg��C��m^-^2��day^-^1)');
    title(name,'fontsize',8);
    colorbar( 'YTick', y_ticks_colorbar, 'YTicklabel',y_ticks_colorbar);
    x_ticks=5;
    y_ticks=5;
    x_step=size(opp_spring,2)/x_ticks;  %����x�����������������ʾһ���̶ȡ�
    y_step=size(opp_spring,1)/y_ticks;  %����y�����������������ʾһ���̶ȡ�
    xtick_loc= round(1:x_step:size(opp_spring,2));%����x��������ʾ�̶ȵ�λ�á�
    ytick_loc= round(1:y_step:size(opp_spring,1));%����y��������ʾ�̶ȵ�λ�á�
    set(gca, 'XTick', xtick_loc);% ����x������Ҫ��ʾ�Ŀ̶�ֵ��
    set(gca, 'YTick', ytick_loc);% ����y������Ҫ��ʾ�Ŀ̶�ֵ��
    set(gca, 'XTickLabel', {round(lons_range(xtick_loc))});
    set(gca, 'YTickLabel', {round(lats_range(ytick_loc))})
    set(gca, 'Color', 'white');
    xlabel ('Longitude(E)','fontsize',10);
    ylabel ('Latitude(N)','fontsize',10);
    outname= strcat(result_path,'\2003���＾opp-����ɫ����.bmp');
    saveas(gcf, outname);
    pause;%��ͣ�Ա�����
    close all;