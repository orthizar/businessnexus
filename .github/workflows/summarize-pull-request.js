module.exports = ({github, context}) => {
  const commits = github.rest.pulls.get(
    {
      issue_number: context.issue.number,
      owner: context.repo.owner,
      repo: context.repo.repo
    }
  );
  console.log("${commits.response.data} commits");
  const commitMessages = commits.data.map(commit => {
    const commitId = commit.sha.substring(0, 7);
    const commitMessage = commit.commit.message;
    return `[${commitId}](https://github.com/${context.repo.owner}/${context.repo.repo}/pull/${context.issue.number}/commits/${commitId}): ${commitMessage}`;
  });
  function formatCommitType(type) {
    const typeDictionary = {
      build: 'Build',
      ci: 'CI',
      docs: 'Documentation',
      feat: 'Feature',
      fix: 'Bug Fix',
      perf: 'Performance',
      refactor: 'Refactor',
      test: 'Testing',
      style: 'Style',
      other: 'Other'
    };
  
    const formattedType = typeDictionary[type.toLowerCase()] || type;
  
    return formattedType;
  }
  
  function formatCommits(commitsData) {
    const commitGroups = {"other": []};

    // Group commits by type
    for (const commit of commitsData) {
      const match = commit.commit.message.match(/^(\w+)\((.*?)\): (.*)/);
      const commitWithLink = `[${id}](https://github.com/${commit.html_url}): ${message}`;
      if (match) {
        const type = match[1];
        const id = commit.sha.substring(0, 7);
        const message = match[3];
  
        if (!commitGroups[type]) {
          commitGroups[type] = [];
        }
        commitGroups[type].push(commitWithLink);
      } else {
        commitGroups["other"].push(commitWithLink);
      }
    }
  

    // Generate the formatted string
    let output = '';
    for (const type in commitGroups) {
      if (length(commitGroups[type]) > 0) {
        output += `## ${formatCommitType(type)}\n`;
        for (const commit of commitGroups[type]) {
          output += `- ${commit}\n`;
        }
      }
    }
  
    return output;
  }
  
  const formattedCommits = formatCommits(commitMessages);
  return formattedCommits;
}
