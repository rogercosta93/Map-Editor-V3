LoadVehicleColorCache() {
    g_DBResult = db_query(g_ResourceDB, "SELECT * FROM vehcolor_data");

    for(new row, rows = db_num_rows(g_DBResult), colorid; row < rows; row ++) {
        colorid = db_get_field_assoc_int(g_DBResult, "colorid");
        if( IsValidVehicleColor(colorid) ) {
            g_VehColorCache[colorid][VEHCOLOR_CACHE_RGB] = db_get_field_assoc_int(g_DBResult, "rgb");

            db_get_field_assoc(g_DBResult, "name", g_VehColorString, sizeof g_VehColorString);
            strpack(g_VehColorCache[colorid][VEHCOLOR_CACHE_NAME], g_VehColorString, MAX_VEHCOLOR_NAMELEN+1);
        }
        db_next_row(g_DBResult);
    }

    db_free_result(g_DBResult);
}

GetVehicleColorRGB(colorid) {
    if( IsValidVehicleColor(colorid) ) {
        return g_VehColorCache[colorid][VEHCOLOR_CACHE_RGB];
    }
    return 0x000000;
}

GetVehicleColorName(colorid, name[], name_size) {
    if( IsValidVehicleColor(colorid) ) {
        return strunpack(name, g_VehColorCache[colorid][VEHCOLOR_CACHE_NAME], name_size), 1;
    }
    return format(name, name_size, "Unknown Color"), 0;
}

FindVehicleColors(result[], result_size, search[], offset, &max_offset) {
    new rows_added;

    if( isempty(search) ) {
        for(new colorid = offset; colorid < MAX_VEHCOLORS; colorid ++) {
            if( rows_added >= result_size ) {
                break;
            }

            result[rows_added ++] = colorid;
        }

        max_offset = MAX_VEHCOLORS - 1;
    } else {
        format(g_QueryString, sizeof g_QueryString, "\
            SELECT colorid, \
            (SELECT COUNT(*) FROM vehcolor_data WHERE colorid LIKE '%%%q%%' OR name LIKE '%%%q%%') AS max_rowcount \
            FROM vehcolor_data \
            WHERE colorid LIKE '%%%q%%' OR name LIKE '%%%q%%' \
            LIMIT %i OFFSET %i",
            search, search,
            search, search,
            result_size, offset
        );

        g_DBResult = db_query(g_ResourceDB, g_QueryString);

        new result_rows = db_num_rows(g_DBResult);

        if( result_rows > 0 ) {
            max_offset = db_get_field_assoc_int(g_DBResult, "max_rowcount") - 1;

            if( max_offset < 0 ) {
                max_offset = 0;
            }
        }

        for(new row; row < result_rows; row ++) {
            if( rows_added >= result_size ) {
                break;
            }

            result[rows_added ++] = db_get_field_assoc_int(g_DBResult, "colorid");
            db_next_row(g_DBResult);
        }

        db_free_result(g_DBResult);
    }

    return rows_added;
}
