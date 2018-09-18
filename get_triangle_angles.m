function [angleP0, angleP1, angleP2, p1p2, p0p2, p0p1] = get_triangle_angles( center_point, p1, p2 )
%GET_TRIANGLE_ANGLES �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
p0p1=sqrt((center_point(1)-p1(1))^2+(center_point(2)-p1(2))^2);
p1p2=sqrt((p2(1)-p1(1))^2+(p2(2)-p1(2))^2);
p0p2=sqrt((center_point(1)-p2(1))^2+(center_point(2)-p2(2))^2);
angleP1=acos((p0p1^2+p1p2^2-p0p2^2)/2/p0p1/p1p2)*180/pi;%����Ϊ�Ƕ�
angleP2=acos((p0p2^2+p1p2^2-p0p1^2)/2/p0p2/p1p2)*180/pi;
angleP0=180-angleP1-angleP2;

end

