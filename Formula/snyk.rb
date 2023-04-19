class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1143.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1143.0/snyk-macos"
    sha256 "9a7051b5382a9d6a70763a3c380c487cb51f08aa9f81db8d15a5cff799dd0e26"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1143.0/snyk-linux"
    sha256 "76bc89fe26822a93151990ebc2fbf1b64757a9fc85546c9b97437d5669294735"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
