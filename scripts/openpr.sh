project=$(az devops project list --query "value[].name" --output table | tail -n +3 | fzf)
query="[].{ Id:codeReviewId Title:title Author:createdBy.displayName Repo:repository.name Status:status IsDraft:isDraft Created:creationDate}"
prs=$(az repos pr list -p "${project}" --output table --query "${query}" | tail -n +3)
chosen_pr=$(echo "${prs}" | fzf | tr -s ' ')
echo $chosen_pr
chosen_pr_id=$(echo "${chosen_pr}" | cut -d ' ' -f 1)
chosen_pr_repo_name=$(az repos pr show --id ${chosen_pr_id} --query "repository.name" | sed "s/\"//g ")

chosen_pr_title=$(az repos pr show --id ${chosen_pr_id} --query "title" | sed "s/\"//g " | sed "s/\ /-/g")


repoUrl="stadium@vs-ssh.visualstudio.com:v3/stadium/${project}/${chosen_pr_repo_name}"
checkout_name="${chosen_pr_id}-${chosen_pr_title}"
git clone "${repoUrl}" "${checkout_name}"
cd $checkout_name
az repos pr checkout --id ${chosen_pr_id}


