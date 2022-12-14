#RUN A QUERY TO FIND OUT THE PLAYER ID FOR LEBRON JAMES
SELECT DISTINCT(PLAYER_ID)
FROM NBA.games_details
WHERE PLAYER_NAME = 'Lebron James';
# Lebron James has the player ID 2544

#USE PLAYER ID TO FIND THE START POSITIONS FOR LEBRON JAMES 
SELECT GAME_ID, TEAM_ABBREVIATION, START_POSITION
 FROM NBA.games_details
 WHERE PLAYER_ID = 2544;
 
 #TO SHOW THE COUNT OF START POSITIONS AT CENTER
 SELECT COUNT(START_POSITION) AS COUNT_CENTER
 FROM NBA.games_details
 WHERE PLAYER_ID = 2544
 AND START_POSITION = 'C';
 #LEBRON STARTED AT CENTER 11 TIMES 
 
 #AT THIS POINT I WANTED TO CONFIRM THE OLDEST GAME IN THE NBA DATASET
 SELECT *
 FROM NBA.games_details
 WHERE PLAYER_ID = 2544
 ORDER BY GAME_ID ASC 
 LIMIT 5;
 #THE OLDEST GAME LEBRON PLAYED IN THIS DATASET HAS THE GAME_ID 11900107
 
 #TO FIND THE CORRESPONDING DATA OF THIS GAME ID I WILL USE INNER JOINS WITH THE GAMES DATASET
 SELECT NBA.games.GAME_DATE_EST
 FROM NBA.games_details
 INNER JOIN NBA.games ON NBA.games.GAME_ID = NBA.games_details.GAME_ID
 WHERE NBA.games_details.PLAYER_ID = 2544
 AND NBA.games_details.GAME_ID = 11900107;
 #THIS QUERY SHOWED THAT GAME_ID IS NOT A RELIABLE METRIC TO FIND THE DATE 
 
 #TO FIND THE PERCENTAGE OF GAMES LEBRON PLAYED ACROSS DIFFERENT TEAMS 
 SELECT COUNT(TEAM_ABBREVIATION = 'LAL') AS Lakers_games
 FROM NBA.games_details
 WHERE PLAYER_ID = 2544;
 
  #TO FIND THE PERCENTAGE OF GAMES LEBRON PLAYED ACROSS DIFFERENT TEAMS 
 SELECT COUNT(GAME_ID) AS Lakers_games
 FROM NBA.games_details
 WHERE PLAYER_ID = 2544
 AND TEAM_ABBREVIATION = 'LAL';
  SELECT COUNT(GAME_ID) AS Cavs_games
 FROM NBA.games_details
 WHERE PLAYER_ID = 2544
 AND TEAM_ABBREVIATION = 'CLE';
  SELECT COUNT(GAME_ID) AS HEAT_games
 FROM NBA.games_details
 WHERE PLAYER_ID = 2544
 AND TEAM_ABBREVIATION = 'MIA';
 
 #The above queries can be combined as below into one query
 SELECT COUNT(case TEAM_ABBREVIATION when 'LAL' then 1 else null end) AS Lakers_games,
 COUNT(case TEAM_ABBREVIATION when 'CLE'then 1 else null end) AS Cavs_games,
 COUNT(case TEAM_ABBREVIATION when 'MIA'then 1 else null end) AS Heat_Games
 FROM NBA.games_details
 WHERE PLAYER_ID = 2544;
 #EXPORTING RESULTS FOR FURTHER VIZ

#SHOWING AVG METRICS (PTS RBS AST) FOR LEBRON IN LAKERS 
SELECT
AVG(PTS) AS AVG_PTS_LAL, AVG(REB) AS AVG_REB_LAL, AVG(AST) AS AVG_AST_LAL
FROM NBA.games_details
WHERE PLAYER_ID = 2544
AND TEAM_ABBREVIATION = 'LAL';

#SHOWING AVG METRICS IN CAVS
SELECT
AVG(PTS) AS AVG_PTS_CLE, AVG(REB) AS AVG_REB_CLE, AVG(AST) AS AVG_AST_CLE
FROM NBA.games_details
WHERE PLAYER_ID = 2544
AND TEAM_ABBREVIATION = 'CLE';

#SHOWING AVG METRICS IN HEAT
SELECT
AVG(PTS) AS AVG_PTS_MIA, AVG(REB) AS AVG_REB_MIA, AVG(AST) AS AVG_AST_MIA
FROM NBA.games_details
WHERE PLAYER_ID = 2544
AND TEAM_ABBREVIATION = 'MIA';


  

 

 
 