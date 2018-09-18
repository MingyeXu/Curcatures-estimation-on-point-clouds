function [ KH,KG,K1,K2 ] = get_curcature( center_point, center_normal, knn_points )
%GET_CURCATURE 此处显示有关此函数的摘要
%   此处显示详细说明
    KH = 0;
    KG = 0;
    k = size(knn_points,2);
    Area = zeros(1, k);
    angles_P0 = zeros(1, k);
    angles_P1 = zeros(1, k);
    angles_P2 = zeros(1, k);
    %get angles and areas
    for m=1:k
        p1=knn_points(:,m);
        if m==k
           p2=knn_points(:,1); 
        else
           p2=knn_points(:,m+1);
        end

        %get angels of triangle
        [angleP0, angleP1, angleP2, p1p2, p0p2, p0p1] = get_triangle_angles(center_point, p1, p2);
        angles_P0(m) = angleP0*pi/180;
        angles_P1(m) = angleP1*pi/180;
        angles_P2(m) = angleP2*pi/180;
        %get Area of triangle
        Area(m) = get_triangle_area(angleP0, angleP1, angleP2, p1p2, p0p2, p0p1);
    end
    
    %cal curcature
    for m = 1:k
        if m == 1
            aplha = angles_P1(k);
            beta = angles_P2(m);
        else
            aplha = angles_P1(m-1);
            beta = angles_P2(m);       
        end
        P1P0 = knn_points(:,m) - center_point;
        KH = KH + (cot(aplha)+cot(beta)+eps)*(sum(P1P0.*center_normal));
        KG = KG + angles_P0(m);
    end
       
    Am = sum(Area);
    KH = KH/(4*Am);
    KG = (2*pi-KG)/Am;
    
    K1 = KH + (KH^2 - KG)^(1/2);
    K2 = KH - (KH^2 - KG)^(1/2);
end

