enum {
    Text: CATMANAGER_GTD_BG,
    Text: CATMANAGER_GTD_CAPTION,
    Text: CATMANAGER_GTD_CLOSE,
    Text: CATMANAGER_GTD_CATEGORY_CREATE,
    Text: CATMANAGER_GTD_CATEGORY_DESTROY,
    Text: CATMANAGER_GTD_CATEGORY_RENAME,
    Text: CATMANAGER_GTD_CATEGORY_BELOW,
    Text: CATMANAGER_GTD_PAGE_F_ALL,
    Text: CATMANAGER_GTD_PAGE_F_CAT,
    Text: CATMANAGER_GTD_PAGE_P_ALL,
    Text: CATMANAGER_GTD_PAGE_P_CAT,
    Text: CATMANAGER_GTD_PAGE_N_ALL,
    Text: CATMANAGER_GTD_PAGE_N_CAT,
    Text: CATMANAGER_GTD_PAGE_L_ALL,
    Text: CATMANAGER_GTD_PAGE_L_CAT,
          CATMANAGER_GTDS
}

enum {
    PlayerText: CATMANAGER_PTD_TYPE_MODELS,
    PlayerText: CATMANAGER_PTD_TYPE_VEHICLES,
    PlayerText: CATMANAGER_PTD_TYPE_SKINS,
    PlayerText: CATMANAGER_PTD_TYPE_TEXTURES,
    PlayerText: CATMANAGER_PTD_CATEGORY_NAME,
    PlayerText: CATMANAGER_PTD_PAGE_ALL,
    PlayerText: CATMANAGER_PTD_PAGE_CAT,
    PlayerText: CATMANAGER_PTD_SEARCH_ALL,
    PlayerText: CATMANAGER_PTD_SEARCH_CAT,
    PlayerText: CATMANAGER_PTD_COL_1_ALL,
    PlayerText: CATMANAGER_PTD_COL_1_CAT,
    PlayerText: CATMANAGER_PTD_COL_2_ALL,
    PlayerText: CATMANAGER_PTD_COL_2_CAT,
    PlayerText: CATMANAGER_PTD_COL_3_ALL,
    PlayerText: CATMANAGER_PTD_COL_3_CAT,
    PlayerText: CATMANAGER_PTD_ROW_1_ALL[MAX_CATMANAGER_ROWS],
    PlayerText: CATMANAGER_PTD_ROW_1_CAT[MAX_CATMANAGER_ROWS],
    PlayerText: CATMANAGER_PTD_ROW_2_ALL[MAX_CATMANAGER_ROWS],
    PlayerText: CATMANAGER_PTD_ROW_2_CAT[MAX_CATMANAGER_ROWS],
    PlayerText: CATMANAGER_PTD_ROW_3_ALL[MAX_CATMANAGER_ROWS],
    PlayerText: CATMANAGER_PTD_ROW_3_CAT[MAX_CATMANAGER_ROWS],
                CATMANAGER_PTDS
}

enum CATMANAGER_DATA {
          CATMANAGER_DATA_CATEGORY,
          CATMANAGER_DATA_SELECT_ID,
          CATMANAGER_DATA_SELECT_ROW,
    bool: CATMANAGER_DATA_SELECT_WINDOW,
          CATMANAGER_DATA_PAGE_ALL,
          CATMANAGER_DATA_PAGE_CAT,
          CATMANAGER_DATA_MAXPAGE_ALL,
          CATMANAGER_DATA_MAXPAGE_CAT,
          CATMANAGER_DATA_SEARCH_ALL[MAX_SEARCH_LEN+1],
          CATMANAGER_DATA_SEARCH_CAT[MAX_SEARCH_LEN+1],
          CATMANAGER_DATA_ROW_ID_ALL[MAX_CATMANAGER_ROWS],
          CATMANAGER_DATA_ROW_ID_CAT[MAX_CATMANAGER_ROWS]
}

new
                g_CatManagerData[MAX_PLAYERS][CATMANAGER_DATA],
    Text:       g_CatManagerGTD[CATMANAGER_GTDS],
    PlayerText: g_CatManagerPTD[MAX_PLAYERS][CATMANAGER_PTDS]
;
