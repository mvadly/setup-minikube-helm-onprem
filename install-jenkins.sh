helmv2 repo add jenkins https://charts.jenkins.io
helmv2 repo update
helmv2 install --name jenkins stable/jenkins \
  --set controller.tag=2.426.3 \
  --set controller.installPlugins[0]=kubernetes:latest \
  --set controller.installPlugins[1]=workflow-aggregator:latest \
  --set controller.installPlugins[2]=git:latest \
  --set controller.installPlugins[3]=configuration-as-code:latest
