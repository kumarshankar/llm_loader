# Clone llama cpp 
git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp

# Download the quantized GGUF Llava model
wget https://huggingface.co/mys/ggml_llava-v1.5-13b/resolve/main/ggml-model-q5_k.gguf
wget https://huggingface.co/mys/ggml_llava-v1.5-13b/resolve/main/mmproj-model-f16.gguf

# use CMAKE to build
mkdir build
cd build
cmake ..
cmake --build . --config Release
cd ..

# Use Llava-cli, pass the model, proj file and image, you can use -p command line argument to pass the prompt, by default describe the image prompt is executed on the passed image
build/bin/llava-cli -m ggml-model-q5_k.gguf --mmproj mmproj-model-f16.gguf --image sample_image.png


