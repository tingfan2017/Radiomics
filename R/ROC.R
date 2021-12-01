# ROC
roc_plot <- function(response_train,response_train_pred,
                     response_test, response_test_pred ){
  
 
  par(mfrow=c(1,2))
  require(pROC)
  
  # train ROC
  plot.roc(response_train,
           response_train_pred,
           main="The ROC of Train set",
           col="1",
           add=F,
           reuse.auc=T,
           axes=T,
           max.auc.polygon=T,
           legacy.axes=F,   # x:0 -> 1
           grid=c(0.2),
           #grid.col=c("green", "red"),
           # auc.polygon.col="skyblue",
           print.thres=T,
           print.auc=T,
           auc.polygon=T,
           identity.lty=1,
           identity.lwd=2,
           asp=1,
           mar=c(4, 4, 2, 2)+.1,
           mgp=c(2.5, 1, 0))
  
  # test ROC
  plot.roc(response_test,
           response_test_pred,
           main="The ROC Curve",
           col="1",
           add=F,
           reuse.auc=T,
           axes=T,
           max.auc.polygon=T,
           legacy.axes=F,   # x:0 -> 1
           grid=c(0.2),
           #grid.col=c("green", "red"),
           #auc.polygon.col="skyblue",
           print.thres=0.490,
           print.auc=T,
           auc.polygon=T,
           identity.lty=1,
           identity.lwd=2,
           asp=1,
           mar=c(4, 4, 2, 2)+.1,
           mgp=c(2.5, 1, 0))
  
}
