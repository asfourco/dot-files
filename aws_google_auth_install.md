# Install AWS Google Authenticator

[`aws_google_auth](https://github.com/cevoaustralia/aws-google-auth) is a utility that allows one
to authenticate AWS access using google SSO mechanisms.

## Requirements:

On Ubuntu install prequisites:

```console
$ sudo apt install libusb-1.0.0-dev libudev-dev
```

## Install

For regular authentication which uses Google's one-time-password install using:  
`sudo apt install aws-google-auth`

However, as in my case, you'd like to use your Yubikey then install:  
`sudo apt install aws-google-auth[u2f]` (bash)  
`sudo apt install "aws-google-auth[u2f]"` (zsh)
