% ��ȡָ�������hdf���ݡ�
% �÷��� result= load_hdf_chinasea(hdf_file, startl, endl, starts, ends)
% ������ 
%       hdf_file  :  �ļ�·��
%       startl    :  ��ʼ��
%       endl      �� ��ֹ��
%       starts    �� ��ʼ��
%       ends      �� ��ֹ��
function result= load_hdf_chinasea(hdf_file, startl, endl, starts, ends)
  file_info= hdfinfo(hdf_file);
  sds_info= file_info.SDS;
  data= hdfread(sds_info);
  result= data(startl:endl, starts:ends);