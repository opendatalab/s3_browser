FROM duffn/python-poetry:3.10.11-slim-1.6.1-2023-08-21 as base

COPY poetry.lock pyproject.toml /s3_browser/
WORKDIR /s3_browser
RUN poetry install --no-dev

COPY s3_browser /s3_browser/

ENV PYTHONPATH "${PYTHONPATH}:/s3_browser"
ENTRYPOINT ["poetry", "run", "streamlit", "run", "Welcome.py", "--server.port=8501", "--server.address=0.0.0.0", "--browser.gatherUsageStats=False"]