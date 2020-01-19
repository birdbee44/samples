# samples

# USE caution when handling these files.


# Tips
Before doing anything with the file, it might be a good idea to run the file command. This is done so the examiner can get a better idea on what type of file the sample is.


# Cowire
The cowrie samples are from my Cowrie Honeypot. Heres is the link if you want to set up your own.
https://github.com/cowrie/cowrie


# Set up an environment
https://remnux.org/<br>
Remnux is a good linux distro that can be used to safetely look at samples. Plus it has all the needed tools built in.
Using Linux is a good idea when reversing malware so the user does not accidently double click the file.
But the analyzer could also use a Windows VM. 

When looking at malware, its also a good idea to set up a environment that is not connected to any other hosts or even the internet. This is so that it can not spread to other hosts. Also its a good idea to get the hash of the ile every once in awhile. This is done to make sure that the malware sample has not changed. File hashs help other researchers identify the same sample. Its a good idea to use SHA1 when getting the hash. But a md5 sum will also work. 

To get the hash of a file. The following commands can be used.<br>
Get sha256sum: ```sha256sum file_name```<br>
Get md5sum:  ```md5sum file_name```<br>
Get sha1sum: ```sha1sum file_name```
<br>
If one little thing is changed in the file, the hash will be different. But keep in mind that recent studies have proven that attackers could create two different files with the same digest. <br>
https://shattered.it/
