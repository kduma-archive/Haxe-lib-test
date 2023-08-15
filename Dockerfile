FROM haxe:4.3

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
#    && dpkg -i packages-microsoft-prod.deb \
#    && rm packages-microsoft-prod.deb

#RUN echo Package: dotnet-sdk-7.0 >> /etc/apt/preferences \
#    && echo Pin: origin "packages.microsoft.com" >> /etc/apt/preferences \
#    && echo Pin-Priority: 999 >> /etc/apt/preferences \
#    && apt-get update \
#    && apt search dotnet-sdk-7.0 \
#    && apt show "dotnet-sdk-7.0/bullseye" -a \
#    && apt-get install -y dotnet-sdk-7.0 \
#    && apt-get clean

# install dependencies
COPY *.hxml /usr/src/app/
RUN yes | haxelib install all --verbose

# compile the project
#COPY . /usr/src/app
#RUN haxe build-php.hxml