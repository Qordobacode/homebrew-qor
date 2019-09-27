class Qor < Formula
   desc "Cli v2 (using Go)"
   homepage "https://github.com/Qordobacode/Cli-v2"
   url "https://github.com/Qordobacode/Cli-v2/archive/v0.7.6-alpha.tar.gz"
   sha256 "df7b481b69f50fbc88c46dfbff9020381247db96bca2ffe6ff6710de24986615"
   head "https://github.com/Qordobacode/Cli-v2.git"

   depends_on "go" => :build

   def install
     ENV["GOPATH"] = buildpath
     src = buildpath/"src/github.com/qordobacode/cli-v2"
     src.install buildpath.children
     src.cd do
       system "go", "build", "-mod", "vendor", "-ldflags", "\"-w -s -X 'github.com/qordobacode/cli-v2/cmd/info.VersionFlag=v0.7.6-alpha'\"", "-o", "#{bin}/qor"
       prefix.install_metafiles
     end
   end

   test do
     assert_match "Qordoba Cli v4.0", shell_output("#{bin}/qor --version")
   end
 end