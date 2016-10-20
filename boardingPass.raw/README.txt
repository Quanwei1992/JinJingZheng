openssl pkcs12 -in /Users/andforce/Desktop/Certificates.p12 -clcerts -nokeys -out /Users/andforce/Desktop/passcertificate.pem -passin pass:
openssl pkcs12 -in /Users/andforce/Desktop/Certificates.p12 -nocerts -out /Users/andforce/Desktop/passkey.pem -passin pass: -passout pass:12345

openssl smime -binary -sign -certfile /Users/andforce/Desktop/WWDR.pem -signer /Users/andforce/Desktop/passcertificate.pem -inkey /Users/andforce/Desktop/passkey.pem -in manifest.json -out signature -outform DER -passin pass:12345

zip -r boardingPass.pkpass manifest.json pass.json signature logo.png logo@\2x.png icon.png icon\@2x.png