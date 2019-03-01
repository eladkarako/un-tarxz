<h1>Un-tar.xz</h1>
Drag&amp;Drop any <code>tar.xz</code>, <code>tar.gz</code>, ... <br/>
over <code>un-tarxz.cmd</code> to extract the content to the current folder. <br/>
Fast. <br/>
Efficient. <br/>
No Temporary Files. <br/>

<hr/>

No Dependencies. <br/>
Modified, portable <a href="https://github.com/mcmilk/7-Zip-zstd">7zip</a> included, <br/>
with additional support for Brotli, Fast-LZMA2, Lizard, LZ4, LZ5 and Zstandard.

<hr/>

<h2>Integration - Placing dependencies</h2>
You may integrate the batch-file and binaries into your project, <br/>
all paths included are relative, so everything will work fine as long the files are at the same folder. <br/>

<h2>Integration - Exit-Code</h2>
The program forwards the exit-codes of 7zip, <br/>
there is no distinction if the exit code was from the first (before the pipeline) execute of 7zip, <br/>
or the second (after the pipeline) execute of the 7zip. <br/>

<hr/>

<h3>Developers:</h3>
If you want an additional folder-wrapping for the output, <br/>
use the line: <br/>

```cmd
call "%~sdp07za.exe" x "%FOLDER%\%LAYER1%" -so  |  "%~sdp07za.exe" x -aoa -si -ttar -o"%LAYER3%"
```

instead-of: 

```cmd
  call "%~sdp07za.exe" x "%FOLDER%\%LAYER1%" -so  |  "%~sdp07za.exe" x -aoa -si -ttar
```

in the batch-file.