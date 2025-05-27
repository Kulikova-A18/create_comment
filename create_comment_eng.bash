#!/bin/bash

# Function to create a comment
function create_comment {
    comment="/\n"

    # Define required and optional tags
    required_tags=(
        "@brief"
    )

    required_tags2=(
        "@param"
        "@return"
    )

    optional_tags=(
        "@throws"
        "@note"
        "@warning"
        "@todo"
        "@deprecated"
        "@see"
        "@file"
    )

    # Request required tags
    for tag in "${required_tags[@]}"; do
        read -p "Enter text for $tag (required): " input
        if [[ -n "$input" ]]; then
            comment+=" * $tag $input\n"
        else
            echo "Error: $tag is required. Please enter a value."
            return
        fi
    done

    # Request function description
    read -p "Enter text for function description (required): " input
    if [[ -n "$input" ]]; then
        comment+=" * $input\n * \n"
    else
        echo "Error: text for function description is required. Please enter a value."
        return
    fi

    # Request additional required tags
    for tag in "${required_tags2[@]}"; do
        read -p "Enter text for $tag (required): " input
        if [[ -n "$input" ]]; then
            comment+=" * $tag $input\n"
        else
            echo "Error: $tag is required. Please enter a value."
            return
        fi
    done

    # Request optional tags
    for tag in "${optional_tags[@]}"; do
        read -p "Enter text for $tag (press Enter to skip): " input
        if [[ -n "$input" ]]; then
            comment+=" * $tag $input\n"
        fi
    done

    comment+="*/"

    # Output the result
    echo -e "$comment"
}

# Example usage
example_comment="
/
 * @brief Reading content from a file
 * 
 * This function opens a file, reads its content, and returns it as a string.
 * 
 * @param filename - The name of the file to read.
 * 
 * @return A string containing the file's content, or NULL if the file cannot be opened.
 * @throws std::runtime_error if the file is not found or cannot be opened.
 * @note Make sure the file exists before calling this function to avoid exceptions.
 * @warning This function allocates memory for the output string; ensure you free it after use.
 * @todo Add support for reading binary files.
 * @deprecated Use read_file_with_buffer() instead for better memory management.
 * @see read_file_with_buffer()
 * @file file_utils.c
*/"

echo -e "$example_comment"

# Call the function
create_comment
