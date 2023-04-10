ARG VERSION=latest
FROM europe-west3-docker.pkg.dev/rasa-releases/rasa-plus/rasa-plus:latest

USER root

RUN apt-get update && \
    apt-get install -y git

RUN /opt/venv/bin/python -m pip install --upgrade pip
RUN poetry --version
# RUN pip install -U git+https://github.com/tmbo/MITIE.git#egg=mitie
RUN pip install transformers
RUN pip install spacy
RUN python -m spacy download en_core_web_md
# RUN python -m spacy download en_core_web_md && \
    # python -m spacy download de_core_news_sm && \
    # python -m spacy download it_core_news_md && \
    # python -m spacy link en_core_web_md en && \
    # python -m spacy link it_core_news_md it && \
    # python -m spacy link de_core_news_sm de

# RUN poetry run python -m pip install -U git+https://github.com/tmbo/MITIE.git#egg=mitie
# RUN poetry run python -m pip install spacy

# The entry point
EXPOSE 5005
ENTRYPOINT ["rasa"]
CMD ["--help"]