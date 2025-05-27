function Create-Comment {
    $comment = @"
/**

"@

    # Define required and optional tags
    $requiredTags = @(
        "@brief"
    )

    $requiredTags2 = @(
        "@param",
        "@return"
    )

    $optionalTags = @(
        "@throws",
        "@note",
        "@warning",
        "@todo",
        "@deprecated",
        "@see",
        "@file"
    )

    # Prompt for required tags
    foreach ($tag in $requiredTags) {
        $input = Read-Host "Enter text for $tag (required)"
        if (-not [string]::IsNullOrWhiteSpace($input)) {
            $comment += " * $tag $input`n"
        }
        else {
            Write-Host "Error: $tag is required. Please provide a value." -ForegroundColor Red
            return
        }
    }

    # Prompt for function text
    $input = Read-Host "Enter text for function description (required)"
    if (-not [string]::IsNullOrWhiteSpace($input)) {
        $comment += " * $input`n * `n"
    }
    else {
        Write-Host "Error: text for function description is required. Please provide a value." -ForegroundColor Red
        return
    }

    # Prompt for additional required tags
    foreach ($tag in $requiredTags2) {
        $input = Read-Host "Enter text for $tag (required)"
        if (-not [string]::IsNullOrWhiteSpace($input)) {
            $comment += " * $tag $input`n"
        }
        else {
            Write-Host "Error: $tag is required. Please provide a value." -ForegroundColor Red
            return
        }
    }

    # Prompt for optional tags
    foreach ($tag in $optionalTags) {
        $input = Read-Host "Enter text for $tag (press Enter to skip)"
        if (-not [string]::IsNullOrWhiteSpace($input)) {
            $comment += " * $tag $input`n"
        }
    }

    $comment += '*/'
    
    Write-Output $comment
}


Write-Output @"
Example:

/**
 * @brief Read content from a file
 * 
 * This function opens a file, reads its content, and returns it as a string.
 * 
 * @param filename - The name of the file to be read.
 * 
 * @return A string containing the content of the file, or NULL if the file cannot be opened.
 * @throws std::runtime_error if the file cannot be found or opened.
 * @note Ensure that the file exists before calling this function to avoid exceptions.
 * @warning This function allocates memory for the output string; make sure to free it after use.
 * @todo Add support for reading binary files.
 * @deprecated Use read_file_with_buffer() instead for better memory management.
 * @see read_file_with_buffer()
 * @file file_utils.c
*/
"@

# Call the function
Create-Comment
