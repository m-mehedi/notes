## Voice switcher Function
```
// voice switcher
function switchVoice(text,voice_name) {
  if (text){
    return "<speak><amazon:domain name='news'><voice name='" + voice_name + "'>" + text + "</voice></amazon:domain></speak>"
  }
}
```

## Usage
`"pageText": switchVoice(speakText1,"Matthew"),`