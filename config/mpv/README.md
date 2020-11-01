# `mpv_thumbnail_script.lua`

### <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="https://raw.githubusercontent.com/felipefacundes/PS/master/imagens/United_States.png" width="32" height="17" title="What is it?" alt="English"></a> A Lua script to display preview thumbnails when hovering over the seekbar, without any external dependencies

### <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="docs/brazil.jpg" width="32" height="17" title="O que é isso?" alt="Portugues Brasil"></a> Um Lua script para exibir miniaturas de visualização ao passar o mouse sobre a barra de busca, sem nenhuma dependência externa

[![](docs/mpv_thumbnail_script.gif "Thumbnail preview for Sintel (2010) on mpv's seekbar")](NULL)

<a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="https://raw.githubusercontent.com/felipefacundes/PS/master/imagens/United_States.png" width="32" height="17" title="What is it?" alt="English"></a> *(You might also be interested in [`PlayOnGit`](https://github.com/felipefacundes/PlayOnGit-en))*

<a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="docs/brazil.jpg" width="32" height="17" title="O que é isso?" alt="Portugues Brasil"></a> *(Você também pode estar interessado em [`PlayOnGit`](https://github.com/felipefacundes/PlayOnGit))*

----

## <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="https://raw.githubusercontent.com/felipefacundes/PS/master/imagens/United_States.png" width="32" height="17" title="What is it?" alt="English"></a> What is it?

`mpv_thumbnail_script.lua` is a script/replacement OSC for [mpv](https://github.com/mpv-player/mpv), to display preview thumbnails when hovering over the seekbar, without any external dependencies [<sup>1</sup>](#Footnotes), cross-platform-ly [<sup>2</sup>](#Footnotes)!

## <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="docs/brazil.jpg" width="32" height="17" title="O que é isso?" alt="Portugues Brasil"></a> O que é isso?

`mpv_thumbnail_script.lua` é um script para substituição OSC no [mpv](https://github.com/mpv-player/mpv), para exibir miniaturas de visualização ao passar o mouse sobre a barra de busca, sem quaisquer dependências externas [<sup>1</sup>](#Footnotes), plataforma-cruzada-ly [<sup>2</sup>](#Footnotes)!

----

## <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="https://raw.githubusercontent.com/felipefacundes/PS/master/imagens/United_States.png" width="32" height="17" title="How?" alt="English"></a> How?

mpv alone does not support generating thumbnails for a preview in the seeking bar ( seekbar ). Bothersome!

However, we can forget external ependencies by calling on mpv itself to use the the built-in [encoding features](https://mpv.io/manual/master/#encoding). Bam! Faster thumbnail generation

## <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="docs/brazil.jpg" width="32" height="17" title="Como?" alt="Portugues Brasil"></a> Como?

mpv por si só não suporta gerar miniaturas para uma pré visualização na barra de busca .

No entanto, podemos esquecer as dependências externas chamando o próprio mpv para usar os [recursos de codificação integrados](https://mpv.io/manual/master/#encoding). Pronto! Agora será capas de gerar miniaturas .

----

## <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="https://raw.githubusercontent.com/felipefacundes/PS/master/imagens/United_States.png" width="32" height="17" title="Configuration" alt="English"></a> Configuration

Create a file called `mpv_thumbnail_script.conf` inside your mpv's `lua-settings` directory.

For example:
  * Linux/Unix/Mac: `~/.config/mpv/lua-settings/mpv_thumbnail_script.conf`
  * Windows: `%APPDATA%\Roaming\mpv\lua-settings\mpv_thumbnail_script.conf`

You can grab an example config [from HERE](https://raw.githubusercontent.com/felipefacundes/mpv_thumbnail_script/main/mpv/lua-settings/mpv_thumbnail_script.conf).

See the [Files section](https://mpv.io/manual/master/#files) in mpv's manual for more info.

## <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="docs/brazil.jpg" width="32" height="17" title="Configuração" alt="Portugues Brasil"></a> Configuração

Crie um arquivo chamado `mpv_thumbnail_script.conf` dentro do diretório `lua-settings` em seu diretório `mpv`.

Por exemplo:
  * Linux/Unix/Mac:  `~/.config/mpv/lua-settings/mpv_thumbnail_script.conf`
  * Windows: `%APPDATA%\Roaming\mpv\lua-settings\mpv_thumbnail_script.conf`

Você pode pegar um exemplo de configuração [AQUI](https://raw.githubusercontent.com/felipefacundes/mpv_thumbnail_script/main/mpv/lua-settings/mpv_thumbnail_script.conf).

Veja a [Seção Arquivos](https://mpv.io/manual/master/#files) no manual do mpv para mais informações.

----

## <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="https://raw.githubusercontent.com/felipefacundes/PS/master/imagens/United_States.png" width="32" height="17" title="installation" alt="English"></a> Script installation and practical use

You can use the template. Already ready. Just clone the repository:
  ```shell
  git clone https://github.com/felipefacundes/mpv_thumbnail_script
  ```

  * Linux/Unix/Mac: After cloning just copy the entire `mpv` folder into `~/.config` folder:
  ```shell
  cd mpv_thumbnail_script && cp -rf mpv ~/.config
  ```

  * Windows: copy the mpv folder to `%APPDATA%\Roaming\`

## <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="docs/brazil.jpg" width="32" height="17" title="Instalação" alt="Portugues Brasil"></a> Instalação e uso prático do script

Você poderá usar o modelo. Já pronto. Basta clonar o repositório:
  ```shell
  git clone https://github.com/felipefacundes/mpv_thumbnail_script
  ```

  * Linux/Unix/Mac: Após a clonagem, basta copiar toda a pasta `mpv` para a pasta`~/.config`:
  ```shell
  cd mpv_thumbnail_script && cp -rf mpv ~/.config
  ```

  * Windows: copie a pasta mpv em `%APPDATA%\Roaming\`

----

## <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="https://raw.githubusercontent.com/felipefacundes/PS/master/imagens/United_States.png" width="32" height="17" title="Change the Lua script" alt="English"></a> Change the Lua script (optional)

You can change the script in Lua by following these guidelines [`string.format()`](http://www.lua.org/manual/5.1/manual.html#pdf-string.format)

## <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="docs/brazil.jpg" width="32" height="17" title="Alterar o Lua script" alt="Portugues Brasil"></a> Alterar o Lua script (opcional)

Você pode alterar o script em Lua seguindo essas orientações [`string.format()`](http://www.lua.org/manual/5.1/manual.html#pdf-string.format)

----

#### Footnotes

<sup>1</sup>You *may* need to add `mpv[.exe]` to your `PATH`.

<sup>2</sup>Developed & tested on Windows and Linux (Ubuntu), but it *should* work on Mac and whatnot as well, if <sup>1</sup> has been taken care of.

#### <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="docs/brazil.jpg" width="32" height="17" title="Notas de rodapé" alt="Portugues Brasil"></a> Notas de rodapé

<sup>1</sup>Você *pode* precisar adicionar `mpv [.exe]` ao seu `PATH`.

<sup>2</sup>Desenvolvido e testado no Windows e Linux (ArchLinux), mas *deve* funcionar no Mac e outros sistemas, se o <sup>1</sup> tiver sido cuidado.

----

# <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="docs/brazil.jpg" width="32" height="17" title="Doação" alt="Portugues Brasil"></a> Doação

Se você realmente gosta disso, pode me doar via [`PayPal`](https://www.paypal.com/donate/?hosted_button_id=REU2UNGXLQQPG).

# <a href="https://github.com/felipefacundes/mpv_thumbnail_script/"><img src="https://raw.githubusercontent.com/felipefacundes/PS/master/imagens/United_States.png" width="32" height="17" title="Change the Lua script" alt="English"></a> Donation

If you really like it, you can pay me with [`PayPal`](https://www.paypal.com/donate/?hosted_button_id=REU2UNGXLQQPG).
