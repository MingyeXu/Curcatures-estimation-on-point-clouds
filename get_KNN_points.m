function [ knn_points ] = get_KNN_points(center_point,xyz,k)
%GET_KNN_POINTS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��    
    delta=xyz-repmat(center_point,1,2048);
    dis=sum(delta.*delta,1);
    [sorteDis, pos]=sort(dis);
    knn_points_ids=pos(1,2:k+1);
    knn_points=xyz(:,knn_points_ids);
end

