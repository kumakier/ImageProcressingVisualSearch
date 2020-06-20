function e = Eigen_PCA(ALLFEAT)

figure(1)
size(ALLFEAT);
 e=Eigen_Build(ALLFEAT)
 e.val;
 e=Eigen_Deflate(e,'keepn',3);
 

%mdist = Eigen_Mahalanobis(query,e);
 
%query_shape = [reshape(query(:,:,1),1,[]) ; reshape(query(:,:,2),1,[]); reshape(query(:,:,3),1,[]) ];

% result = reshape(mdist,size(query))
% nresult=result./max(max(result))
% imgshow(nresult)

%  ALLFEATPCA=Eigen_Project(ALLFEAT,e)';
% size(ALLFEATPCA)
% plot3(ALLFEATPCA(:,1),ALLFEATPCA(:,2),ALLFEATPCA(:,3),'bx');
% title('PCA')
% xlabel('eigenvector1');
% ylabel('eigenvector2');
% zlabel('eigenvector3');

end