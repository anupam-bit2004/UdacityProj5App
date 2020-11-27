FROM python:3.7.3-stretch
	
WORKDIR /app
	
COPY . app.py /app/

#Install requirements
#hadolint ignore=DL3008,DL3015
RUN python -m pip install --trusted-host pypi.python.org -r requirements.txt

#hadolint ignore=DL3008,DL3015
RUN python -m nltk.downloader punkt

#Download corpora
RUN curl https://raw.githubusercontent.com/codelucas/newspaper/master/download_corpora.py

# Expose port 5000
EXPOSE 5000

# Run app.py at container launch
CMD ["python3", "app.py"]
