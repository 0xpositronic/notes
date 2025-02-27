# Create main directory structure
mkdir -p journals ml_dl/concepts ml_dl/interpretability ml_dl/resources ml_dl/implementations cs_math projects thoughts tools

# --- STEP 1: JOURNAL ENTRIES ---
# Moving dated journal entries to journals/
echo "Moving journal entries..."
mv daily/1*.md journals/ 2>/dev/null
mv daily/2*.md journals/ 2>/dev/null
mv son/daily/2*.md journals/ 2>/dev/null
mv Journals/2*.md journals/ 2>/dev/null
mv daily/erm.md journals/ 2>/dev/null  # Non-English journal
mv 18-02-2025-sonnet.md journals/  # Claude conversation
mv daily/24.05.2020.md journals/ 2>/dev/null
mv daily/31_10_2024.md.md journals/31_10_2024.md 2>/dev/null  # Fix double extension

# --- STEP 2: ML/DL FILES ---
echo "Moving machine learning and deep learning files..."

# Moving concept files
mv dl/*Quantization*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/*CNNs*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/*CNN*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Gradient\ descent.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Log-Likelihood*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/RELU.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/RNNs.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Regulatization.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Residual\ Models.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Universal*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/latent\ space.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/COST*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Generative*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Measuring*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Parameter*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Properties*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Temporal*.md ml_dl/concepts/ 2>/dev/null
mv dl/dl/Training*.md ml_dl/concepts/ 2>/dev/null
mv dl/Perplexity.md ml_dl/concepts/ 2>/dev/null
mv dl/hallucinations.md ml_dl/concepts/ 2>/dev/null
mv dl/CUDA.md ml_dl/concepts/ 2>/dev/null
mv dl/block\ quantization.md ml_dl/concepts/ 2>/dev/null
mv dl/cmore.md ml_dl/concepts/ 2>/dev/null
mv newdl/Byte\ pair\ encoding.md ml_dl/concepts/ 2>/dev/null
mv newdl/Weight\ decay.md ml_dl/concepts/ 2>/dev/null
mv newdl/weighted\ aggregation*.md ml_dl/concepts/ 2>/dev/null

# Moving interpretability files
mv newdl/mech_interp/*.md ml_dl/interpretability/ 2>/dev/null
mv dl/mech.md ml_dl/interpretability/ 2>/dev/null

# Moving implementation examples
mv dl/Quantization\ example.md ml_dl/implementations/ 2>/dev/null
mv dl/torch.md ml_dl/implementations/ 2>/dev/null

# Moving resource files
mv dl/dl_resources.md ml_dl/resources/ 2>/dev/null
mv dl/dl/Other\ notes.md ml_dl/resources/ 2>/dev/null
mv dl/dl/Progress.md ml_dl/resources/ 2>/dev/null
mv dl/improve.md ml_dl/resources/ 2>/dev/null
mv dl/vram\ calculation.md ml_dl/resources/ 2>/dev/null
mv ai_canvas.md ml_dl/resources/ 2>/dev/null

# Moving project/implementation ideas
mv dl/idea.md projects/dl_ideas.md 2>/dev/null

# --- STEP 3: CS/MATH FILES ---
echo "Moving CS and math files..."
mv cs/floats.md cs_math/ 2>/dev/null
mv Math/math.md cs_math/ 2>/dev/null

# --- STEP 4: PROJECTS ---
echo "Moving project files..."
mv other/league_gradio.md projects/ 2>/dev/null
mv other/midas.md projects/ 2>/dev/null
mv todo.md projects/ 2>/dev/null
mv todo.md.orig projects/todo_backup.md 2>/dev/null

# --- STEP 5: THOUGHTS ---
echo "Moving thought files..."
mv thoughts/*.md thoughts/ 2>/dev/null
mv thoughts/stash/*.md thoughts/ 2>/dev/null
mv thoughts/persistent/*.md thoughts/ 2>/dev/null
mv memetics/cogsec.md thoughts/ 2>/dev/null
mv fallback.md thoughts/ 2>/dev/null
mv daily/Untitled.md thoughts/daily_notes.md 2>/dev/null  # Appears to be thoughts
mv _dump.md thoughts/ 2>/dev/null  # Empty but keeping for completeness

# --- STEP 6: TOOLS ---
echo "Moving tools..."
mv kanba/simple-launcher.html tools/ 2>/dev/null
mv note_manager/note_manager.html tools/ 2>/dev/null

# Keep .gitignore and README at root
# Move .keep to config if needed
mkdir -p config
mv .keep config/ 2>/dev/null

# Remove empty directories
echo "Cleaning up empty directories..."
find . -type d -empty -delete

echo "Reorganization complete!"
