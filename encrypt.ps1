# Choose which folder to encrypt
$FolderPath = Read-Host "Please enter the path to the folder you want to encrypt their files"

# Select the public key you want to use to encrypt
$PubKey = Read-Host "Please enter the path to the Public Key you want to use to encrypt the files"

# Selects all the files in the folder
ForEach ($FileToEncrypt in Get-ChildItem $FolderPath) {

# Encrypts all files with the public key, and adds the ".encrypted" extension to the name of the encrypted files
openssl pkeyutl -encrypt -pubin -inkey $PubKey -in $FileToEncrypt.FullName -out ($FileToEncrypt.FullName + ".encrypted")
}

# Deletes all unencrypted files in the folder
Remove-Item -recurse $FolderPath\* -exclude *.encrypted
