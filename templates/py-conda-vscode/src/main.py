from pathlib import Path


def main():
    print("Scaffold OK for __PROJECT_NAME__")
    print("Project root:", Path(__file__).resolve().parents[1])


if __name__ == "__main__":
    main()
