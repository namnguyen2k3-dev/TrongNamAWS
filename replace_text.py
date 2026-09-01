import os

content_dir = r"c:\UnityGame\Project_CloudGameCMS - Copy\TrongNamAWS\content"

replacements = {
    "Cloud Game CMS": "Adaptive Boss AI",
    "CloudGameCMS": "AdaptiveBossAI"
}

count = 0
for root, dirs, files in os.walk(content_dir):
    for file in files:
        if file.endswith(".md"):
            filepath = os.path.join(root, file)
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
            
            new_content = content
            for old, new in replacements.items():
                new_content = new_content.replace(old, new)
            
            if new_content != content:
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                count += 1
                print(f"Updated {filepath}")

print(f"Total files updated: {count}")
