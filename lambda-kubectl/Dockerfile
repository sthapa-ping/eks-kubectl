FROM amazonlinux:latest

WORKDIR /root

RUN yum update -y && yum install -y unzip make wget git zip

ADD https://s3.amazonaws.com/aws-cli/awscli-bundle.zip /root

RUN unzip awscli-bundle.zip && \
    cd awscli-bundle;

#RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN ./awscli-bundle/install -i /opt/awscli -b /opt/awscli/aws

# install jq
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
&& mv jq-linux64 /opt/awscli/jq \
&& chmod +x /opt/awscli/jq


# download kubectl
ADD https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl /opt/kubectl/
RUN chmod +x /opt/kubectl/kubectl

#
# prepare the runtime at /opt/kubectl

#




# awscli and other utils
#
COPY /opt/awscli/lib/python2.7/site-packages/ /opt/awscli/
#COPY /opt/awscli/bin/ /opt/awscli/bin/
#COPY /opt/awscli/bin/aws /opt/awscli/aws;
#COPY /opt/awscli/jq /opt/awscli/jq;
#COPY /usr/bin/make /opt/awscli/make;

# COPY /usr/bin/unzip /opt/awscli/unzip;
# COPY /usr/bin/git /opt/awscli/git;
# COPY /usr/bin/zip /opt/awscli/zip;

# #
# # kubectl
# #
# COPY /opt/kubectl/kubectl /opt/kubectl/kubectl

# # remove unnecessary files to reduce the size
# RUN rm -rf /opt/awscli/pip* /opt/awscli/setuptools* /opt/awscli/awscli/examples


# # wrap it up
# RUN cd /opt; zip -r ../layer.zip *; \
# echo "/layer.zip is ready"; \
# ls -alh /layer.zip;
