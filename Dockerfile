FROM ubuntu:22.04

# Avoid timezone prompt during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Update Software Repo
RUN apt update -y

# Install openssh client
RUN apt install -y openssh-client

#RUN apt install -y software-properties-common
#RUN add-apt-repository universe
RUN apt update -y
RUN apt install git -y
RUN apt install python3 -y
RUN apt install curl -y
RUN apt install python3-pip -y
RUN pip3 install PyPDF2
RUN pip3 install pdfplumber
RUN pip3 install pan-os-python
RUN pip3 install python_otbr_api
#RUN curl -sSL https://install.python-poetry.org | python3 -

#RUN apt install python-dev -y
#RUN apt install libxml2-dev -y
#RUN apt install libxslt-dev -y
#RUN apt install libssl-dev -y
#RUN apt install libffi-dev -y

# Create .ssh dir to hold local keys
RUN mkdir -p -m 0600 /root/.ssh/

# Set the working directory to scripts; we'll bind the local dev env to this dir in a volume at runtime
RUN mkdir /scripts
WORKDIR /scripts
