### A versão que presta do optimus-manager é essa a 1.2.2
A versão recente é focada em economia de energia, dando preferência a GPU intel, para Nvidia possui alguns bugs. Percebi que no openbox com a versão recente do optimus-manager, as janaelas não em floating não maximizam, e esse é um dos bugs irritantes que percebi.

###### A versão 1.2.2 do optimus-manager:

Essa versão mais antiga é focada em desempenho, dando prioridade a GPU Nvidia, e praticamente não há bugs, sem dizer que o desempenho é excelente:

###### Para manter a GPU Nvidia sempre ativa, basta executar o seguinte:

```
sudo systemctl enable optimus-manager.service
sudo systemctl start optimus-manager.service
optimus-manager --set-startup nvidia
```
