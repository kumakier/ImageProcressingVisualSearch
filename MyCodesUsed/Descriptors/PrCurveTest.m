
Model = fitctree(ALLFEAT(:,1:2),Classes, ... 
    'ClassNames' , {'10','11' , '12', '13' , '14', '15', '16', '17', '18', '19', '20' , '1', '2', '3', '4', '5', '6', '7', '8', '9' });
[~,scores] = resubPredict(Model);

diffscore = scores(:,2) - max(scores(:,1),scores(:,3));

[X,Y,T,AUC] = perfcurve(Classes,diffscore,'12');
plot(X,Y)
xlabel('False positive rate')
ylabel('True positive rate')




%% Old Stuff
% pred = query(1:64);
% resp = (1:64)'>64;  % Versicolor = 0, virginica = 1
% mdl = fitglm(pred,resp,'Distribution','binomial','Link','logit');
% 
% 
% scores = mdl.Fitted.Probability;
% [X,Y,T,AUC] = perfcurve(Classes(1:64,:),scores,'11');
% plot(X,Y)
% xlabel('False positive rate')
% ylabel('True positive rate')
% title('ROC for Classification by Logistic Regression')

