595. Big Countries
Table: World
A country is big if:

it has an area of at least three million (i.e., 3000000 km2), or 
it has a population of at least twenty-five million (i.e., 25000000).
The result format is in the following example.

# SOLUTION 1:

import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    filtered_df = world[(world['area']>=3000000) | (world['population']>=25000000)]
    filtered_df = filtered_df[['name','population','area']]
    return filtered_df 


# SOLUTION 2: Using .query()

def big_countries(world: pd.DataFrame) -> pd.DataFrame: 
    return world.query("area >= 3000000 or population >= 25000000")[['name', 'population', 'area']]
