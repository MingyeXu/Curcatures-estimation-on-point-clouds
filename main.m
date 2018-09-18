%% read h5 file
data_xyz = h5read('ply_data_test1.h5','/data');
data_normal = h5read('ply_data_test1.h5','/normal');

readID=27;

xyz=squeeze(data_xyz(:,:,readID));
normal=squeeze(data_normal(:,:,readID));
%% cal curvature
k = 10;
KH = zeros(1,2048);
KG = zeros(1,2048);
K1 = zeros(1,2048);
K2 = zeros(1,2048);
for m=1:2048
   center_point = squeeze(xyz(:,m));
   center_normal = squeeze(normal(:,m));
   knn_points = get_KNN_points(center_point,xyz,k);
   [ KH(m),KG(m),K1(m),K2(m) ] = get_curcature(center_point, center_normal, knn_points);
end

KH_C = log10(mapminmax(KH,1,500));
KG_C = log10(mapminmax(KG,1,500));
% 
% KH_C = log10(K1);
% KG_C = log10(K2);
% 
% KH_C = mapminmax(KH_C,0,255);
% KG_C = mapminmax(KG_C,0,255);
%% display 
px=squeeze(data_xyz(1,:,readID));
py=squeeze(data_xyz(2,:,readID));
pz=squeeze(data_xyz(3,:,readID));
figure;
scatter3(px, py, pz, 15, KH_C, 'fill');
figure;
scatter3(px, py, pz, 15, KG_C, 'fill');
