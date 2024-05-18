import customtkinter as ctk

# Set the appearance mode and theme
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

# Create the main window
root = ctk.CTk()
root.title("Simple Calculator")
root.geometry("600x400")

# Create the display label
display_label = ctk.CTkLabel(root, text="0", font=("Arial", 24))
display_label.pack(pady=20)

# Create the buttons
button_frame = ctk.CTkFrame(root)
button_frame.pack(pady=20)

buttons = [
    "7", "8", "9", "/",
    "4", "5", "6", "*",
    "1", "2", "3", "-",
    "0", ".", "=", "+"
]

for i, button_text in enumerate(buttons):
    if button_text == "=":
        button = ctk.CTkButton(button_frame, text=button_text, command=lambda x=button_text: evaluate_expression())
    else:
        button = ctk.CTkButton(button_frame, text=button_text, command=lambda x=button_text: append_to_display(x))
    button.grid(row=i // 4, column=i % 4, padx=5, pady=5)


current_expression = "0"

def append_to_display(value):
    global current_expression
    if current_expression == "0":
        current_expression = value
    else:
        current_expression += value
    display_label.configure(text=current_expression)

def evaluate_expression():
    global current_expression
    try:
        result = str(eval(current_expression))
        display_label.configure(text=result)
        current_expression = result
    except:
        display_label.configure(text="Error")
        current_expression = "0"


root.mainloop()
