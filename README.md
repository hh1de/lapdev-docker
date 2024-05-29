#  Lapdev, but even easier

  

Lapdev (original under AGPLv3 from this [github repo: lapcelapdev](https://github.com/lapce/lapdev)) is a .devcontaineir compatible selfhosted solution for pre-configured Dev environments and serves as a good alternative to GitHub Codespaces etc...

  

The problem with it is, that there's no official Docker version, which is why i decided to go ahead and make Docker images based on Lapdev (my builds are based on this [github repo: lapce/lapdev](https://github.com/lapce/lapdev))

[Docker hub: lapdev](https://hub.docker.com/r/hh1de/lapdev)
[Docker hub: lapdev-ws](https://hub.docker.com/r/hh1de/lapdev-ws)

  
  


#  How to run it

(lapdev-ws doesn't work yet, so you should update the docker-compose and remove lapdev-ws. You have to run lapdev-ws some other way until i have a working image for it.)
  Use `git clone https://github.com/hh1de/lapdev-docker.git`, then run `cd lapdev-docker`.
  Or you could also just copy-paste the contents of the .env and the docker-compose.yml.
  
  Then, modify the .env to your liking and start it, using `docker-compose up -d`.

Your interface will be accessible on the machine's ip with your chosen ports.
From there on, you can just follow the guide at [docs.lap.dev](https://docs.lap.dev/installation/quickstart#cluster-initiation). 
The only thing you should look out for, is to set the hostname of the workspace host to the name you gave your lapdev-ws docker container (only if it's from the same docker-compose of course).
  
  


# License
This project is licensed under AGPLv3 as well.




# Additional

Hi, i'm rather inexperienced and young with all of this, so git, github, Dockerfiles and licensing. But i'm trying my best.
I also don't know if i'll finish or maintain this project, and how possible an image will be after lapdev added VM functionality (as stated on their github).
If you have or see any issues or want to contact me, use the issues tab (i think that's the best way but even here, im not certain :O).
