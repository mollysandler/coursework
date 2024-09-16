#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include <sys/time.h>
#include <netdb.h>
#include <dirent.h>
#include <stdint.h>
#include <string.h>
#include <sys/stat.h>
#include "array_list.h"

void display(ArrayList *arraylist){ //done
    for(int i = 0; i < arraylist -> length; i++){
        printf("county name: %s\n", arraylist -> items[i].name);
        printf("\tcounty state: %s\n", arraylist -> items[i].state);
        printf("\tcounty percent population of American Indian or Alaska Native ethnicity: %f\n", arraylist -> items[i].eth_am_indian);
        printf("\tcounty percent population of Asian ethnicity: %f\n", arraylist -> items[i].eth_asian);
        printf("\tcounty percent population of black ethicity: %f\n", arraylist -> items[i].eth_black);
        printf("\tcounty percent population of Hispanic or Latino ethnicity: %f\n", arraylist -> items[i].eth_hispanic);
        printf("\tcounty percent population of Native Hawaiian and other Pacific Islander ethncity: %f\n", arraylist -> items[i].eth_hawaiian);
        printf("\tcounty percent population of two or more races: %f\n", arraylist -> items[i].eth_two);
        printf("\tcounty percent population of white ethnicity: %f\n", arraylist -> items[i].eth_white);
        printf("\tcounty percent population of white ethnicity not Hispanic or LAtino: %f\n", arraylist -> items[i].eth_white_no);
        printf("\tcounty median housing income: %d\n", arraylist -> items[i].income_median);
        printf("\tcounty income per capita: %d\n", arraylist -> items[i].income_capita);
        printf("\tcounty percent of population below the poverty line: %d\n", arraylist -> items[i].income_below_poverty);
        printf("\tcounty population in 2014: %d\n", arraylist -> items[i].pop_2014);
    }//end of for loop
}//end of display function

ArrayList* filter_state(ArrayList *arraylist, char* abb){ //done
    ArrayList *arraylist_filtered = array_list_new();
    for(int i = 0; i < arraylist -> length; i++){
        if(strcmp(arraylist -> items[i].state, abb) == 0){
            array_list_add_to_end(arraylist_filtered, &(arraylist -> items[i]));
        }
    }
    printf("Filter: state == %s, %d entries\n", abb, arraylist_filtered -> length);
    return arraylist_filtered;
}

float helper(char* field, County *county){
    if(strcmp(field, "Education.Bachelor's Degree or Higher") == 0){
        return county -> edu_bachelors;
    }
    if(strcmp(field, "Education.High School or Higher") == 0){
        return county -> edu_hs;
    }
    if(strcmp(field, "Ethnicities.American Indian and Alaska Native Alone") == 0){
        return county -> eth_am_indian;
    }
    if(strcmp(field, "Ethnicities.Asian Alone") == 0){ //
        return county -> eth_asian;
    }
    if(strcmp(field, "Ethnicities.Black Alone") == 0){
        return county -> eth_black;
    }
    if(strcmp(field, "Ethnicities.Hispanic or Latino") == 0){
        return county -> eth_hispanic;
    }
    if(strcmp(field, "Ethnicities.Native Hawaiian and Other Pacific Islander Alone") == 0){
        return county -> eth_hawaiian;
    }
    if(strcmp(field, "Ethnicities.Two or More Races") == 0){
        return county -> eth_two;
    }
    if(strcmp(field, "Ethnicities.White Alone") == 0){
        return county -> eth_white;
    }
    if(strcmp(field, "Ethnicities.White Alone not Hispanic or Latino") == 0){
        return county -> eth_white;
    }
    if(strcmp(field, "Ethnicities.White Alone, not Hispanic or Latino") == 0){
        return county -> eth_white;
    }
    if(strcmp(field, "Income.Median Household Income") == 0){
        return county -> income_median;
    }
    if(strcmp(field, "Income.Per Capita Income") == 0){
        return county -> income_capita;
    }
    if(strcmp(field, "Income.Persons Below Poverty Level") == 0){
        return county -> income_below_poverty;
    }
    else{
        return 0;
    }
}//end of helper

float helper_two(char* field, County *county){
    if(strcmp(field, "Education.Bachelor's Degree or Higher") == 0){
        return county -> edu_bachelors;
    }
    if(strcmp(field, "Education.High School or Higher") == 0){
        return county -> edu_hs;
    }
    if(strcmp(field, "Ethnicities.American Indian and Alaska Native Alone") == 0){
        return county -> eth_am_indian;
    }
    if(strcmp(field, "Ethnicities.Asian Alone") == 0){ //
        return county -> eth_asian;
    }
    if(strcmp(field, "Ethnicities.Black Alone") == 0){
        return county -> eth_black;
    }
    if(strcmp(field, "Ethnicities.Hispanic or Latino") == 0){
        return county -> eth_hispanic;
    }
    if(strcmp(field, "Ethnicities.Native Hawaiian and Other Pacific Islander Alone") == 0){
        return county -> eth_hawaiian;
    }
    if(strcmp(field, "Ethnicities.Two or More Races") == 0){
        return county -> eth_two;
    }
    if(strcmp(field, "Ethnicities.White Alone") == 0){
        return county -> eth_white;
    }
    if(strcmp(field, "Ethnicities.White Alone not Hispanic or Latino") == 0){
        return county -> eth_white;
    }
    if(strcmp(field, "Ethnicities.White Alone, not Hispanic or Latino") == 0){
        return county -> eth_white;
    }
    if(strcmp(field, "Income.Persons Below Poverty Level") == 0){
        return county -> income_below_poverty;
    }
    else{
        return 0;
    }
}//end of helper

ArrayList* filter(ArrayList *arraylist, char* field, char* gl, float number){ //done
    ArrayList *arraylist_filtered = array_list_new();
    char* valid[16] = {"County", "State", "Education.Bachelor's Degree or Higher", "Education.High School or Higher", "Ethnicities.American Indian and Alaska Native Alone", "Ethnicities.Asian Alone", "Ethnicities.Black Alone", "Ethnicities.Hispanic or Latino", "Ethnicities.Native Hawaiian and Other Pacific Islander Alone", "Ethnicities.Two or More Races", "Ethnicities.White Alone", "Ethnicities.White Alone not Hispanic or Latino", "Ethnicities.White Alone, not Hispanic or Latino", "Income.Median Household Income", "Income.Per Capita Income", "Income.Persons Below Poverty Level"};
    int exist = 0;
    if(strcmp(field, "County") == 0 || (strcmp(field, "State") == 0)){
        printf("this is a valid field, but it is not numerical. please try again.\n");
        return NULL;
    }
    for(int i = 0; i < 16; i++){
        if(strcmp(field, valid[i]) == 0){
            exist = 1;
            break;
        }
    }//end of for loop

    if(exist == 0){
        printf("Sorry this field does not exist, please try again\n");
        return NULL;
    }

    for(int j = 0; j < arraylist -> length; j++){ //get i to be accessible
        if(strcmp(gl, "ge") == 0){
            if(helper(field, &arraylist -> items[j]) >= number){
                array_list_add_to_end(arraylist_filtered, &arraylist -> items[j]);
            }
        }
        else if(strcmp(gl, "le") == 0){
            if(helper(field, &arraylist -> items[j]) <= number){
                array_list_add_to_end(arraylist_filtered, &arraylist -> items[j]);
            }
        }
        else{
            printf("this is not a valid character entry\n");
            return NULL;
        }
    }//end of second for loop

    printf("Filter: %s %s %f %d entries\n", field, gl, number, arraylist_filtered -> length);
    return arraylist_filtered;
}

int population_total(ArrayList *arraylist) { //done
    int total = 0;
    for(int i = 0; i < arraylist -> length; i++){
        total = total + arraylist -> items[i].pop_2014;
    }
    printf("2014 population: %d\n", total); 
    return total;   
}//end of population_total

float population(ArrayList *arraylist, char* field){
    float total = 0;
    for(int j = 0; j < arraylist -> length; j++){ 
        float percent = helper(field, &arraylist -> items[j]);
        total = arraylist -> items[j].pop_2014 * (percent / 100);
    }
    printf("2014 %s population: %f\n", field, total);
    return total;
}

void percent(ArrayList *arraylist, char* field){
    float sum_total = population_total(arraylist);
    float sub_total = population(arraylist, field);
    float answer = sub_total / sum_total;
    printf("2014 %s percentage: %f\n", field, answer);
}//end of percent field
