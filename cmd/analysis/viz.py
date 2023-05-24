import psycopg2
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np


def draw_hist(df : pd.DataFrame, columns,
              filename, title, size, xlim,
              yticks, xticks_need_rotate):
    plt.figure(figsize=size)
    plot = sns.histplot(data=df, x=columns[0])
    plt.title(title)
    
    if xlim != -1:
        plt.xlim(0, xlim)
        
    if type(yticks) != int:
        plt.yticks(yticks)
        
    if xticks_need_rotate:
        for item in plot.get_xticklabels():
            item.set_rotation(45)
    
    plt.savefig(filename)
    

def draw_counting_heatmap(df : pd.DataFrame, filename,
                          columns, title, figsize):
    plt.figure(figsize=figsize)
    df['counter'] = 1
    pt = pd.pivot_table(
        data=df, index=columns[1], columns=columns[0],
        values='counter', aggfunc=np.sum
    )
    sns.heatmap(data=pt)
    plt.title(title)
    plt.savefig(filename)
    

def draw_barplot(df : pd.DataFrame, columns,
                 filename, title, figsize):
    plt.figure(figsize=figsize)
    plt.title(title)
    sns.barplot(data=df, x=columns[0], y=columns[1])
    plt.savefig(filename)

conn = psycopg2.connect(
    database='pg_db', user='postgres',
    password='postgres', host='127.0.0.1',
    port='5432'
)


# users table analysis
users_df = pd.read_sql(
    'SELECT * FROM music.Users;',
    conn
)

users_df['year_registered'] = users_df['register'].astype(str)
users_df['year_registered'] = users_df['year_registered'].str[:4]
draw_counting_heatmap(
    users_df,
    './analysis/images/year_registration_playlists.png',
    ['year_registered', 'playlists'],
    'Connection between year of registration and number of playlists',
    (20, 20)
)

users_df['year_born'] = users_df['birthdate'].astype(str)
users_df['year_born'] = users_df['year_born'].str[:4]
draw_counting_heatmap(
    users_df,
    './analysis/images/privileged_users_and_their_birth_years.png',
    ['year_born', 'privileged'],
    'Connection between the born year and user status',
    (30, 10)
)

draw_hist(
    users_df,
    ['country'],
    './analysis/images/countries_hist.png',
    'Users\' countries',
    (20, 10), -1, -1, False
)

draw_hist(
    users_df,
    ['playlists'],
    './analysis/images/playlists_hist.png',
    'Playlists',
    (10, 10), -1, -1, False
)

# playlists analysis
playlists_df = pd.read_sql(
    'SELECT * FROM music.Playlists;',
    conn
)

draw_hist(
    playlists_df,
    ['songs'],
    './analysis/images/songs_number.png',
    'Songs number in playlists',
    (20, 10), 7, -1, False
)

# songwriters analysis
songwriters_df = pd.read_sql(
    'SELECT * FROM music.Songs_songwriters',
    conn
)

draw_hist(
    songwriters_df,
    ['songwriter'],
    './analysis/images/songs_songwriters.png',
    'Songwriters and number of their songs',
    (20, 10), -1, np.arange(0, 4, 1), True
)

# countries analysis
countries_df = pd.read_sql(
    'SELECT * FROM music.Countries',
    conn
)

draw_barplot(
    countries_df,
    ['name', 'songwriters'],
    './analysis/images/songwriters_and_their_countries.png',
    'Songwriters and their countries',
    (20, 10),
)

