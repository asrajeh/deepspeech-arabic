# deepspeech-arabic

This is a preliminary experiment to build an end-to-end Arabic ASR using DeepSpeech engine (https://github.com/mozilla/DeepSpeech).

I used Common Voice Corpus 7.0 for training (https://commonvoice.mozilla.org/en/datasets). In this version, Arabic voices are 1,052 and the total length is 117 hours. However, the model is trained on just 30 hours and tested on 12 hours. 

Training on a workstation with 4 RTX GPUs took less than 20 mins. WER is very high but it can be improved with more data. I also have not used a scorer (language model) to improve the result. For comparision with an alternative approach, I rerun the experiment on Kaldi to build a DNN-HMM based model (https://github.com/asrajeh/kaldi-arabic). Its performance is much better (WER 29%). DeepSpeech models require a lot of recording hours (>30) before reaching an acceptable WER.

You can download the model and example audio from here:

https://drive.google.com/file/d/1Gn9RvoSUhq5lDCAZHgOVxt8Ypdg6DdZH/view?usp=sharing

https://drive.google.com/file/d/1A8hxuSTwpYibh6Q0lblWNfDEJyzKPLrZ/view?usp=sharing


## Testing
```
# Create and activate a virtualenv
virtualenv -p python3 $HOME/tmp/deepspeech-venv/
source $HOME/tmp/deepspeech-venv/bin/activate

# Install DeepSpeech
pip3 install deepspeech

# Transcribe an audio file
deepspeech --model common_voice-v7.0-ar.pbmm --audio common_voice_ar_24033139.wav
```

## Training
I used this crash course:

https://mozilla.github.io/deepspeech-playbook/

You need to preprocess the data (preprocess_cv.sh) and use Arabic alphabet (alphabet-ar.txt). Have a look at my training log file (common_voice-v7.0-ar.log).
