function [ Area ] = get_triangle_area( angleP0, angleP1, angleP2, p1p2, p0p2, p0p1 )
%GET_TRIANGLE_AREA �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    R=p1p2/(2*sin((angleP0/180)*pi));
    if angleP0 < 90
    % Acute angle
        Area = (sqrt(R*R-p0p1*p0p1/4)*p0p1)/4+(sqrt(R*R-p0p2*p0p2/4)*p0p1)/4;
    else
        Area = ((p1p2 * p0p1 * p0p2)/(4*R))/2;
    end

end

