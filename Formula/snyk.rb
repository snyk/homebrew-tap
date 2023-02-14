class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1103.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1103.0/snyk-macos"
    sha256 "78bbeb7b2aa3e1168ce895a7d03dfaaca7d92efa30d9b05dd295d4d5b6c583c3"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1103.0/snyk-linux"
    sha256 "0b2a00989f20a06e77446c64cce99d11044f1e325f32ff20606e55a75e136fea"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
