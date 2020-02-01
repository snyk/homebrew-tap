class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.290.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.290.1/snyk-macos"
    sha256 "6ae91ccef351ff5fe35f0ed9377b769212838ed371d2023daf8ef7273865ff9a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.290.1/snyk-linux"
    sha256 "b56d8548e94e67bdb4ba833ff6bfe1486bf3d2b5ab63aec20b093e3017d52074"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
