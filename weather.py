#!/usr/bin/env python3

import argparse
import requests


# Function to request weather data from OpenWeatherMap API
def request_weather(api_key, city, country):
    paramaters = {"q": f"{city},{country}",
                  "appid": api_key, "units": "metric"}
    try:  # Handle potential request errors
        response = requests.get(
            "http://api.openweathermap.org/data/2.5/weather", params=paramaters
        )
        return response.json()  # Return the JSON response
    except requests.exceptions.RequestException as e:
        print(f"Error fetching weather data: {e}")
        return None


# Function to display weather data
def display_weather(weather_data):
    cod_success = 200  # API response code for success
    cod_not_found = 404  # API response code for city not found

    # If successful response, extract and display relevant data
    if weather_data.get("cod") == cod_success:
        city = weather_data.get("name")
        country = weather_data.get("sys", {}).get("country")
        temperature = weather_data.get("main", {}).get("temp")
        humidity = weather_data.get("main", {}).get("humidity")
        description = weather_data.get("weather", [{}])[0].get("description")

        print(f"\nCity: {city}, {country}")
        print(f"Temperature: {temperature}°C")
        print(f"Humidity: {humidity}%")
        print(f"Weather Description: {description}")
        # If response indicates city not found, display error message
    elif weather_data.get("cod") == cod_not_found:
        print("City not found. Please check the city name and country code.")
        return


# Little Function to read API key from a file
def read_api_key(file_path):
    with open(file_path, "r") as file:
        return file.read().strip()


# Main function to run the script
def main():
    start_message = (
        "Welcome to the Weather Script. Provide the city and country code.\n"
    )
    print(start_message)
    city = input("Please enter city code. E.g., London: ")
    country = input("Please enter country code. E.g., US for United States: ")

    city = city.strip()
    country = country.strip()
    api_key = read_api_key(
        "config/owm_api_key.txt"
    )  # Store your API key in api_key.txt. Just the key, no extra whitespace.

    weahter_data = request_weather(api_key, city, country)
    display_weather(weahter_data)


if __name__ == "__main__":
    """
    Main function to start the script. More a placeholder for future
    enhancements.

    """

    arg_parser = argparse.ArgumentParser(
        description="Weather Information Script based on City and Country Code."
    )
    main()
