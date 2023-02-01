class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1093.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1093.0/snyk-macos"
    sha256 "f3552cf6d7254ff458bdbf05b4175bdaf2679398b8f18932b47ba17efcd40dbe"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1093.0/snyk-linux"
    sha256 "240060ce7923d9d6cc3549827f7509433b6b691718557ce67b864fc231ca7d3d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
