# Import
import pandas as pd
import glob
import uuid
import argparse

# parse args
parser = argparse.ArgumentParser()
parser.add_argument('--input', type=str, required=True)
parser.add_argument('--output', type=str, required=True)
args = parser.parse_args()

# Parameters
INPUT_PATH = args.input  # "../data/hackathon_dataset/fora/*.csv"
OUTPUT_PATH = args.output  # "../data/base.parquet"

# read csv files into one unified DataFrame
df = []
for file in glob.glob(INPUT_PATH):
    tmp = pd.read_csv(file)
    tmp["date"] = pd.DatetimeIndex(tmp.date)
    df.append(tmp)
df = pd.concat(df)

# generate row-wise UUIDs as primary key
df.loc[:, "uuid"] = df.apply(lambda g: str(uuid.uuid4()), axis=1)

# ensure strict data typing
df = df.astype({
    "community": str,
    "user_id": str,
    "thread_id": str,
    "subject": str,
    "category": str,
    "body": str,
    "quotes": str,
    "uuid": str
})

# write unified dataframe to parquet
df.to_parquet(OUTPUT_PATH, compression="gzip")
